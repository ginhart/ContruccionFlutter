import 'dart:ui';
import 'package:animate_do/animate_do.dart';
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
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.network(
                          'https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg',
                          height: 300,
                          width: 200),
                      Expanded(
                          child: const Text.rich(
                              TextSpan(text: '', children: <TextSpan>[
                        TextSpan(text: 'Nombre: \n', style: TextStyle()),
                        TextSpan(text: 'Android Studio \n', style: TextStyle()),
                        TextSpan(text: 'Autor: \n', style: TextStyle()),
                        TextSpan(
                            text: 'Jesus Tomas, Vicente Carbonell \n',
                            style: TextStyle()),
                        TextSpan(text: 'Editorial: \n', style: TextStyle()),
                        TextSpan(text: 'Marcombo \n', style: TextStyle()),
                        TextSpan(text: 'Páginas: \n', style: TextStyle()),
                        TextSpan(text: '3000 \n', style: TextStyle()),
                      ])))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Row(children: <Widget>[
                        const Text.rich(TextSpan(text: '', children: <TextSpan>[
                          TextSpan(text: 'Disponibilidad: \n', style: TextStyle()),
                          TextSpan(
                              text: '0 \n', style: TextStyle()),
                              TextSpan(text: 'Tiempo restante: \n', style: TextStyle()),
                          TextSpan(
                              text: '00:00 \n', style: TextStyle()),
                        ])),
                      ])
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          FadeInDown(child: IconButton(icon: Icon(Icons.favorite)),duration: Duration(seconds:1),),
                          FadeInUp(child: Text('Agregar a Favoritos'),),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FadeInDown(child: IconButton(icon: Icon(Icons.star)),duration: Duration(seconds:1),),
                          FadeInUp(child: Text('Agregar a Deseados'),),
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
