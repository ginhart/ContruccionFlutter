import 'package:bibliotek/Models/Book.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
   BookModel libro = new BookModel();
  Book({Key key, this.libro}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  Book book = new Book();

  Widget bookDescriptionTemplate(book) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Image.network(

                    widget.libro.imagen,
                    //height: 300,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Nombre:'),
                    subtitle: Text(widget.libro.nombre),
                  ),
                  ListTile(
                    title: Text('Autor:'),
                    subtitle: Text(widget.libro.autor),
                  ),
                  ListTile(
                    title: Text('Editorial:'),
                    subtitle: Text(widget.libro.editorial),
                  ),
                  ListTile(
                    title: Text('Páginas:'),
                    subtitle: Text(widget.libro.paginas),
                  ),
                ],
              )),
            ],
          ),
          bookDisponibilityTemplate(book),
          bookButtons(book),
        ],
      ),
    );
  }

  Widget bookDisponibilityTemplate(book) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Disponibilidad:'),
              subtitle: Text(widget.libro.disponibilidad.toString()),
            ),
            ListTile(
              title: Text('Tiempo Restante:'),
              subtitle: Text('decrpcion'),
            ),
          ],
        )),
      ],
    );
  }

  Widget bookButtons(book) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: ButtonBar(
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              child: Row(
                children: [Text('Agregar a Favoritos'), Icon(Icons.star)],
              ),
            ),
            RaisedButton(
              onPressed: null,
              child: Row(
                children: [Text('Agregar a Deseados'), Icon(Icons.favorite)],
              ),
            )
          ],
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Bibliotek'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  bookDescriptionTemplate(book),
                  //bookDisponibilityTemplate(book),
                ],
              ),
            ),
          )),
    );
  }
}
/*import 'dart:ui';

import 'package:flutter/material.dart';


class Book extends StatefulWidget {
  Book({Key key}) : super(key: key);

  @override
  _BookState createState() => _BookState();
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
                          IconButton(onPressed: null, icon: Icon(Icons.favorite)),
                          Text('Agregar a Favoritos'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(onPressed: null, icon: Icon(Icons.star)),
                          Text('Agregar a Deseados'),
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
*/
