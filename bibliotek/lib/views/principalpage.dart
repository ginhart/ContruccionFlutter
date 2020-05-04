import 'package:bibliotek/views/deseados.dart';
import 'package:bibliotek/views/favorite.dart';
import 'package:bibliotek/views/favoritos.dart';
import 'package:bibliotek/views/psicologylibrary.dart';
import 'package:bibliotek/views/settings.dart';
import 'package:bibliotek/views/systemslibrary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bibliotek/views/historiallibrary.dart';
import './about.dart';
import 'deseados.dart';
import 'psychologylibrary.dart';
import 'businesslibrary.dart';
import 'marketinglibrary.dart';
import 'mathlibrary.dart';
import 'industriallibrary.dart';
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
    return MaterialApp(
      home: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    tabs: [
                      Tab(
                        text: 'Psicologia',
                      ),
                      Tab(
                        text: 'Negocios',
                      ),
                      Tab(text: 'Mercadeo'),
                      Tab(
                        text: 'Matematicas',
                      ),
                      Tab(
                        text: 'Sistemas',
                      ),
                      Tab(text: 'Industrial'),
                    ]),
                preferredSize: Size.fromHeight(30.0),
              ),
              title: Text('Bibliotek'),
            ),
            drawer: new Drawer(
              child: ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text('Juan '),
                    accountEmail: new Text('juan@konradlorenz.edu.co'),
                    currentAccountPicture: new CircleAvatar(
                      backgroundImage:
                          new NetworkImage('http://i.pravatar.cc/300'),
                    ),
                  ),
                  new ListTile(
                    title: Row(children: [Icon(Icons.schedule), Text('Libros Deseados.')],),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new HistorialLibrary()));
                    },
                  ),
                  /*new ListTile(
              title: new Text('Temas'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AboutPage()));
              },
            ),*/
                  new ListTile(
                    title: Row(children: [Icon(Icons.star), Text('Libros Favoritos.')],),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Favorite()));
                    },
                  ),
                  new ListTile(
                   title: Row(children: [Icon(Icons.favorite), Text('Libros Deseados.')],),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Deseados()));
                    },
                  ),
                  new ListTile(
                    title: Row(children: [Icon(Icons.settings), Text('Configuración.')],),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SettingsPage()));
                    },
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              PsychologyLibrary(),
              BusinessLibrary(),
              MarketingLibrary(),
              MathLibrary(),
             
              SystemsLibrary(),
              IndustrialLibrary(),
            ]),
          )),
    );
  }
}
