import 'package:Bibliotek/Models/Book.dart';
import '../functions/Global.dart' as Global;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Bibliotek/views/book.dart';
import 'package:Bibliotek/Services/Consulta.dart';
import 'book.dart';



class HistorialLibrary extends StatefulWidget {
  HistorialLibrary({Key key}) : super(key: key);

  @override
  _HistorialLibraryState createState() => _HistorialLibraryState();
}

class _HistorialLibraryState extends State<HistorialLibrary> {

  Widget _inputsearch=new Container(); 
  Consulta _consulta = new Consulta();
  final Firestore _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
      
  
      ),
     body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              _inputsearch,
              Text(
                'Historial.',
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
                    .collection('Historial')
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
       child: SingleChildScrollView(scrollDirection: Axis.horizontal,
            child: Card( 
          child: Row(
            children: <Widget>[
              Image.network(
                snapshot.data['Imagen'],
                height: 150,
              ), Column(children: [
                Text(
                snapshot.data['Nombre'],
                style: TextStyle(fontSize: 18),
              ),
              
              ],)
              
            ],
          ),
        )),
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
