import 'package:flutter/material.dart';

class Historial extends StatefulWidget {
  Historial({Key key}) : super(key: key);

  @override
  _HistorialState createState() => _HistorialState();
}

class HistorialC {
  String title, writer, editorial, image, time;
  int pages, disponibilidad;

  HistorialC(this.title, this.writer, this.editorial, this.pages, this.image,
      this.disponibilidad, this.time);
  /*  BookC book('Android Studio', 'Jesus Tomas, Vicente Carbonell',
      'Marcombo', 300, 'https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg',1,'00:00');*/
}

class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BiblioteK'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg'),
              Text('Android Studio'),
            ],
          ),
        ),
      ),
    );
  }
}
