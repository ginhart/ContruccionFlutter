import 'package:flutter/material.dart';
import 'package:bibliotek/functions/BeautyTextfield.dart';
import 'package:bibliotek/views/book.dart';

class Deseados extends StatefulWidget {
  Deseados({Key key}) : super(key: key);

  @override
  _DeseadosState createState() => _DeseadosState();
}

class _DeseadosState extends State<Deseados> {
  Widget _inputsearch = new Container();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Libros Deseados'),
          actions: [
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
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              children: <Widget>[
                _inputsearch,
                GestureDetector(
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          "https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg",
                          height: 150,
                        ),
                        Text(
                          'El Gran Libro de Android.',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Book()),
                    );
                  },
                ),
                GestureDetector(
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          "https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg",
                          height: 150,
                        ),
                        Text(
                          'El Gran Libro de Android.',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Book()),
                    );
                  },
                ),
                GestureDetector(
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          "https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg",
                          height: 150,
                        ),
                        Text(
                          'El Gran Libro de Android.',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Book()),
                    );
                  },
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
