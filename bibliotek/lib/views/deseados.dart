import 'package:Bibliotek/Models/Book.dart';
import 'package:Bibliotek/functions/BeautyTextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../functions/Global.dart' as Global;
import 'package:flutter/material.dart';

import 'book.dart';

class Deseados extends StatefulWidget {
  Deseados({Key key}) : super(key: key);

  @override
  _DeseadosState createState() => _DeseadosState();
}

class _DeseadosState extends State<Deseados> {
  Widget _inputsearch = new Container();
  final Firestore _db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              _inputsearch,
              Text(
                'Libros Deseados.',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
              StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return snapshot.hasData
                      ? Column(
                          children: buildBooks(snapshot.data.documents),
                        )
                      : CircularProgressIndicator();
                },
                stream: _db
                    .collection('Usuarios')
                    .document(Global.user.id)
                    .collection('Deseados')
                    .getDocuments()
                    .asStream(),
              ),
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


