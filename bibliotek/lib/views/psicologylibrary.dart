import 'package:bibliotek/Services/Consulta.dart';
import 'package:bibliotek/functions/BeautyTextfield.dart';
import 'package:bibliotek/views/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PsicologyLibrary extends StatefulWidget {
  PsicologyLibrary({Key key}) : super(key: key);

  @override
  _PsicologyLibraryState createState() => _PsicologyLibraryState();
}

class _PsicologyLibraryState extends State<PsicologyLibrary> {
  Widget _inputsearch = new Container();
  Consulta _consulta = new Consulta();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _inputsearch = BeautyTextfield(
                  width: double.maxFinite,
                  height: 60,
                  maxLines: 1,
                  duration: Duration(milliseconds: 300),
                  inputType: TextInputType.text,
                  placeholder: "...",
                  prefixIcon: Icon(Icons.search),
                  backgroundColor: Colors.white54,
                  onTap: () {
                    print('Click');
                  },
                  onChanged: (text) {
                    print(text);
                  },
                  onSubmitted: (data) {
                    print(data.length);
                  },
                );
              });
            },
          ),
          // action button

          // overflow menu
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              _inputsearch,
              Text(
                'Libros de Psicología.',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
              StreamBuilder(
                  stream: this._consulta.buscarLibrosFiltrados('Psicología'),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                return snapshot.hasData? 
                Column(children: buildBooks(snapshot.data.documents),) :CircularProgressIndicator();
              })
            ],
          )),
        ),
      ),
    ));
  }

  List<Widget> buildBooks(List<DocumentSnapshot> documentos){
        List<Widget> books = documentos.map((DocumentSnapshot snapshot) {return GestureDetector(
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          snapshot.data['Imagen'],
                          height: 150,
                        ),
                        Text(
                          snapshot.data['Nombre'],
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Book()),
                    );
                  },
                ); }).toList();
                return books;
       
  }

}
