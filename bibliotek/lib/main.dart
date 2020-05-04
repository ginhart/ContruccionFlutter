import 'package:bibliotek/views/login.dart';
import 'package:flutter/material.dart';
import 'package:bibliotek/blocs/them.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  /*  return MaterialApp(
      title: 'BiblioteK',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}*/





/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {*/
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigoAccent,
          )),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget  {

  @override
  Widget build (BuildContext context) {

final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),
      title: 'Bibliotek',
      home: Login(),
    );
  }
}

