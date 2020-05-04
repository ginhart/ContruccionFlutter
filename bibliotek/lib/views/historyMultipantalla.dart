import 'package:bibliotek/views/dummy/historial.dart';
import 'package:flutter/material.dart';
import 'package:bibliotek/views/dummy/carrera.dart';

class HistoryClass extends StatelessWidget {
   
   HistoryClass({
    @required this.carreraSelectedCallback,
    this.selectedCarrera,
    });

  final ValueChanged<Libro> carreraSelectedCallback;
  final Libro selectedCarrera;
   Widget _inputsearch=new Container();


  @override
  Widget build(BuildContext context) {
   return new ListView.builder(
         itemCount: dataDummyLibro.length, itemBuilder: (context, i) => new Column(
           children: <Widget>[
            new Divider(
              height: 10,
              
            ),
            Card(
            elevation: 5,
            borderOnForeground: true,
            semanticContainer: false, 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)),
            child: Column(
            children: <Widget>[
            Image.asset(dataDummyLibro[i].imagenLibro),
         ListTile(
          title: Text(dataDummyLibro[i].nombre),
          onTap: ()=> carreraSelectedCallback(dataDummyLibro[i]),
          selected: selectedCarrera == dataDummyLibro[i],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
           ],
         )
       ],
     ),
   )
   
        ],
          )
          );
  }
}
