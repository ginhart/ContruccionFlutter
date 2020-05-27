import 'package:Bibliotek/Models/Book.dart';
import 'package:Bibliotek/Services/Consulta.dart';
import 'package:Bibliotek/functions/BeautyTextfield.dart';
import 'package:Bibliotek/views/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SystemsLibrary extends StatefulWidget {
  SystemsLibrary({Key key}) : super(key: key);

  @override
  _SystemsLibraryState createState() => _SystemsLibraryState();
}

class _SystemsLibraryState extends State<SystemsLibrary> {

  Widget _inputsearch = new Container();
  Consulta _consulta = new Consulta();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              _inputsearch,
              Text(
                'Libros de Sistemas.',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
              StreamBuilder(
                  stream: this._consulta.buscarLibrosFiltrados('Sistemas'),
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
        child: Container(
            //SingleChildScrollView(scrollDirection: Axis.horizontal,
            child: Card(
          child: Row(
            children: <Widget>[
              Image.network(
                snapshot.data['Imagen'],
                height: 150,
                width: 100,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    snapshot.data['Nombre'],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Book(
                      libro: libro,
                    )),
          );
        },
      );
    }).toList();
    return books;
  }
}
