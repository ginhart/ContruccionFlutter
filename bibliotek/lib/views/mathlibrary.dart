import 'package:Bibliotek/Models/Book.dart';
import 'package:Bibliotek/Services/Consulta.dart';
import 'package:Bibliotek/functions/BeautyTextfield.dart';
import 'package:Bibliotek/views/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MathLibrary extends StatefulWidget {
  MathLibrary({Key key}) : super(key: key);

  @override
  _MathLibraryState createState() => _MathLibraryState();
}

class _MathLibraryState extends State<MathLibrary> {

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
                'Libros de Matemáticas.',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
              StreamBuilder(
                  stream: this._consulta.buscarLibrosFiltrados('Matemáticas'),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return snapshot.hasData
                        ? Column(
                            children: buildBooks(snapshot.data.documents),
                          )
                        : CircularProgressIndicator();
                  })
            ],
          )),
        ),
      ),
    ));
  }

  List<Widget> buildBooks(List<DocumentSnapshot> documentos) {
    List<Widget> books = documentos.map((DocumentSnapshot snapshot) {
      BookModel libro = new BookModel(
          id: snapshot.documentID,
          imagen: snapshot.data['Imagen'],
          disponibilidad: snapshot.data['Disponibilidad'],
          paginas: snapshot.data['Páginas'],
          editorial: snapshot.data['Editorial'],
          autor: snapshot.data['Autor'],
          nombre: snapshot.data['Nombre'],
          facultad: snapshot.data['Facultad']);

      print(libro);
      return GestureDetector(
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
            MaterialPageRoute(builder: (context) => Book(libro: libro,)),
          );
        },
      );
    }).toList();
    return books;
  }
}
