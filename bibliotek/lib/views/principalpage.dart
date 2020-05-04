import 'package:bibliotek/views/masterDetailContainer.dart';
import 'package:bibliotek/views/principalMultipantalla.dart';
import 'package:bibliotek/views/settings.dart';
import 'package:bibliotek/views/systemslibrary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bibliotek/views/historiallibrary.dart';
import './about.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new PrincipalPage(),
    );
  }
}

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

// class PrincipalPage extends StatefulWidget {
//   PrincipalPage({Key key}) : super(key: key);

//   @override
//   _PrincipalPageState createState() => _PrincipalPageState();
// }

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(buildContext) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BiblioteK"),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Juan '),
              accountEmail: new Text('juan@konradlorenz.edu.co'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            new ListTile(
              title: new Text('Historial'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new HistorialLibrary()));
              },
            ),
            new ListTile(
              title: new Text('About'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AboutPage()));
              },
            ),new ListTile(
              title: new Text('Configuracion'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new SettingsPage()));
              },
            ),
          ],
        ),
      ),
      body: MasterDetailContainer()
    );
  }
}
