import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bibliotek/blocs/them.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: ListaBotones(),
    );
  }
}

class ListaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('Claro'),
          onPressed: () => theme.setTheme(ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent,
          )),
        ),
        FlatButton(
          child: Text('Oscuro'),
          onPressed: () => theme.setTheme(ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            accentColor: Colors.indigoAccent,
          )),
        ),
        FlatButton(
          child: Text('Verde'),
          onPressed: () => theme.setTheme(
                ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.teal,
                  primaryColor: Colors.teal,
                  accentColor: Colors.teal,
                  cardColor: Colors.teal[100],
                  // cardTheme: CardTheme(shadowColor: Colors.teal,elevation: 9.0),
                ),
              )
          ),
      ],
    );
  }
}
