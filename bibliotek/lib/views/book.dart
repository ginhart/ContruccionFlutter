import 'dart:ui';

import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  Book({Key key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class BookC {
  String title, writer, editorial, image, time;
  int pages, disponibilidad;

  BookC(this.title, this.writer, this.editorial, this.pages, this.image,
      this.disponibilidad, this.time);
  /*  BookC book('Android Studio', 'Jesus Tomas, Vicente Carbonell',
      'Marcombo', 300, 'https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg',1,'00:00');*/
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BiblioteK'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(children: <Widget>[
              Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                      'https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg',
                      height: 300,
                      width: 200),
                  const Text.rich(TextSpan(text: '', children: <TextSpan>[
                    TextSpan(text: 'Nombre \n', style: TextStyle()),
                    TextSpan(text: 'Autor \n', style: TextStyle()),
                    TextSpan(text: 'Editorial \n', style: TextStyle()),
                    TextSpan(text: 'Páginas \n', style: TextStyle()),
                  ])),
                ],
              ),
              Row(children: <Widget>[
                Text('aasd')
              ],)
              ],)
            ]),
          ),
        ),
      ),
    );
  }
}

/*Comparison of the performances of land use regression modelling and dispersion modelling in estimating small-scale variations in long-term air pollution concentrations in a Dutch urban area



CAR model (Calculation of Air pollution from Road traffic)
modelo LUR land use regression 
modelo de dispersion

COPERT*/