import 'package:Bibliotek/Services/AutService.dart';
import 'package:Bibliotek/views/deseados.dart';
import 'package:Bibliotek/blocs/them.dart';
import 'package:Bibliotek/views/favoritos.dart';
import 'package:Bibliotek/views/search.dart';
import 'package:Bibliotek/views/settings.dart';
import 'package:Bibliotek/views/systemslibrary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Bibliotek/views/historiallibrary.dart';
import 'deseados.dart';
import 'login.dart';
import 'psychologylibrary.dart';
import 'businesslibrary.dart';
import 'marketinglibrary.dart';
import 'mathlibrary.dart';
import 'industriallibrary.dart';
import 'package:provider/provider.dart';

import '../functions/Global.dart' as Global;

/*void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new PrincipalPage(),
    );
  }
}*/

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

// class PrincipalPage extends StatefulWidget {
//   PrincipalPage({Key key}) : super(key: key);

//   @override
//   _PrincipalPageState createState() => _PrincipalPageState();
// }

class _PrincipalPageState extends State<PrincipalPage> {
  String urlImage;
  Autentication logeo = new Autentication();
  /*
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  getUrl() async {
    final FirebaseUser user = await _auth.currentUser();
    _storage.ref().child('${user.uid}.jpg').getDownloadURL().then((url) {
      setState(() {
        urlImage = url;
      });
    });
  }
/ */
  @override
  Widget build(buildContext) {
    /*getUrl();/ */
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      home: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(icon: Icon (Icons.search), onPressed: (){
                  print('Search');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Search()));
                })
              ],
              bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    tabs: [
                      Tab(
                        text: 'Psicología',
                      ),
                      Tab(
                        text: 'Negocios',
                      ),
                      Tab(text: 'Mercadeo'),
                      Tab(
                        text: 'Matemáticas',
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
                    accountName: new Text(
                        Global.user.nombre + ' ' + Global.user.apellido),
                    accountEmail: new Text(Global.user.correo),
                    currentAccountPicture: new CircleAvatar(
                      backgroundImage:
                          new NetworkImage('$urlImage'),
                    ),
                  ),
                  new ListTile(
                    title: Row(
                      children: [Icon(Icons.schedule), Text('Historial.')],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new HistorialLibrary()));
                    },
                  ),
                  new ListTile(
                    title: Row(
                      children: [Icon(Icons.star), Text('Libros Favoritos.')],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Favoritos()));
                    },
                  ),
                  new ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.favorite),
                        Text('Libros Deseados.')
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Deseados()));
                    },
                  ),
                  new ListTile(
                    title: Row(
                      children: [Icon(Icons.settings), Text('Configuración.')],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SettingsPage()));
                    },
                  ),
                  
                 /* new ListTile(
              title: new Text('Temas'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AboutPage()));
              },
            ),*/
                  new ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        Text('Cerrar Sesión')
                      ],
                    ),
                    onTap: () {
                      logeo.logout().then((value) => {
                            Navigator.of(context).pop(),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new Login()))
                          });
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
