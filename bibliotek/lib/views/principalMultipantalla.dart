import 'package:bibliotek/views/dummy/carrera.dart';
import 'package:bibliotek/views/systemslibrary.dart';
import 'package:flutter/material.dart';


class CarrerasClass extends StatelessWidget{

  CarrerasClass({
      @required this.carreraSelectedCallback,
      this.selectedCarrera,
  });
  
  final ValueChanged<Carrera> carreraSelectedCallback;
  final Carrera selectedCarrera;
 
 
  @override
  Widget build(BuildContext context) {
 
     return new ListView.builder(
      itemCount: dataDummy.length, itemBuilder: (context, i) => new Column(
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
            Image.asset(dataDummy[i].imagenCarrera),
         ListTile(
          title: Text(dataDummy[i].tituloCarrera),
          onTap: ()=> carreraSelectedCallback(dataDummy[i]),
          selected: selectedCarrera == dataDummy[i],
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
    ),
    );
  }
}
