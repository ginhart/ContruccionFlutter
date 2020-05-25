import 'package:Bibliotek/Services/AutService.dart';
import 'package:Bibliotek/Services/Push_notificattion_Service.dart';
import 'package:Bibliotek/views/deseados.dart';
import 'package:Bibliotek/blocs/them.dart';
import 'package:Bibliotek/views/favoritos.dart';
import 'package:Bibliotek/views/settings.dart';
import 'package:Bibliotek/views/systemslibrary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Bibliotek/views/historiallibrary.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final Firestore _db = Firestore.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;
  bool noti;

  @override
  void initState(){
    super.initState();
    
    _auth.currentUser().then((user){
      _db.collection("Usuarios").document(user.uid).get().then((doc){
        noti = doc.data['Notificaciones'];
        if(noti){
          _showNotification();//llama la notificicaion
          initializationSettingsAndroid = new AndroidInitializationSettings('konradlogogris');
          initializationSettingsIOS = new IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification
          );
          initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
          flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
          final pushProvider = new PushNotificationProvider();
          pushProvider.initNotifications();

          pushProvider.mensajes.listen((argumento){
            navigatorKey.currentState.pushNamed(argumento);
          });
          }
          });
        });
  }

  Future onSelectNotification(String payload) async{
    if(payload != null){
      debugPrint('Notification payload: $payload');
    }
  }

  Future onDidReceiveLocalNotification(int id, String title, String body, String p) async{
    await showDialog(context: context,
    builder: (BuildContext context)=>CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(child: Text("OK"),
        onPressed: () async {
          debugPrint('pressed');
        },)
      ],
    ));
  }

  void _showNotification() async{
    await _demoNotification();
  }

  Future<void> _demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails("channelId", "channelName", "channelDescription", importance: Importance.Max, priority: Priority.High, ticker: "test Ticker");
    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics,iOSChannelSpecifics);

    _auth.currentUser().then((user){
      _db.collection("Usuarios").document(user.uid).collection("Favoritos").getDocuments().then((docs){
        docs.documents.forEach((f){
          if(f.data['Disponibilidad']==0){
            flutterLocalNotificationsPlugin.show(0, 'Disponibilidad', 'El libro "${f.data['Nombre']}" no esta disponible', platformChannelSpecifics, payload: 'test payload');
          }
        });
      });
    });
    //Notificacion
    //await flutterLocalNotificationsPlugin.show(0, 'Hola mundo', 'body', platformChannelSpecifics, payload: 'test payload');
  }

  String urlImage;
  Autentication logeo = new Autentication();
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

  @override
  Widget build(buildContext) {
    getUrl();
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {
        'Deseados' : (BuildContext context) => Deseados(),
      },
      theme: theme.getTheme(),
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
