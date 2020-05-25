import 'package:Bibliotek/Models/Book.dart';
import 'package:Bibliotek/Services/Consulta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'book.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  Consulta _consulta = new Consulta();
  String filtro = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
            decoration: InputDecoration(labelText: 'Busca un Libro'),
            onChanged: (text){
               setState(() {
                 filtro = text;
               });
            },),
      ),
      body: StreamBuilder(
          stream: this._consulta.traerLibrosBuscados(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            
            List<DocumentSnapshot> librosFilt = new List<DocumentSnapshot>();

            
              librosFilt = snapshot.data.documents.where((element) => element.data['Nombre'].toString().toLowerCase().contains(this.filtro.toLowerCase())).toList();
            
            return snapshot.hasData
          
                        ? SingleChildScrollView(child:  Column(
                          
                            children: buildBooks(librosFilt),
                          ),) 
                        : CircularProgressIndicator();
          }),
    );
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
