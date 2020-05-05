import 'package:bibliotek/Models/Book.dart';
import 'package:bibliotek/functions/BeautyTextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../functions/Global.dart' as Global;
import 'package:flutter/material.dart';

import 'book.dart';

class Favoritos extends StatefulWidget {
  Favoritos({Key key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  Widget _inputsearch = new Container();
  final Firestore _db = Firestore.instance;
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
                'Libros Favoritos.',
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
                    .collection('Favoritos')
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
