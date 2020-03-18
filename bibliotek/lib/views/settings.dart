import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('About'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                height: 130,
                child: Card(
                    elevation: 10,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://i.pravatar.cc/300"),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7.0, color: Colors.black)
                                ]),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Chip(
                                label: Text('Juan'),
                                shadowColor: Colors.blue,
                                backgroundColor: Colors.lightBlueAccent,
                                elevation: 10,
                              )),
                        )
                      ],
                    ))),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Perfil", textScaleFactor: 1.5),
            ),
            Container(
              child: MaterialButton(
                color: Colors.lightBlueAccent,
                child: Text('Carmbiar contraseña'),
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Cambiar contraseña",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'antigua contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'confirmar contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Nueva contraseña',
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cambiar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Aplicacion", textScaleFactor: 1.5),
            ),
            Container(
              child: MaterialButton(
                color: Colors.lightBlueAccent,
                child: Text('Idioma'),
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Cambiar contraseña",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'antigua contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'confirmar contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Nueva contraseña',
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cambiar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.lightBlueAccent,
                child: Text('Notificaciones'),
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Cambiar contraseña",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'antigua contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'confirmar contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Nueva contraseña',
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cambiar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.lightBlueAccent,
                child: Text('Tamaño de fuente'),
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Cambiar contraseña",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'antigua contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'confirmar contraseña',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: 'Nueva contraseña',
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cambiar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
              ),
            ),
          ],
        ));
  }
}
