import 'package:bibliotek/views/favorite.dart';
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
                    title: new Text('Historial'),
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
                    title: new Text('Libros Favoritos'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Favorite()));
                    },
                  ),
                  new ListTile(
                    title: new Text('Libros Deseados'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new HistorialLibrary()));
                    },
                  ),
                  new ListTile(
                    title: new Text('Configuracion'),
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
              SystemsLibrary(),
              Text('Lista 2'),
              Text('Lista 3'),
              Text('Lista 4'),
              Text('Lista 5'),
              Text('Lista 6'),
            ]),
          )),
    );
  }
}
