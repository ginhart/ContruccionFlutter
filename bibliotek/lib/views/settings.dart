import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<BorderRadius> _borderRadius;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);

    _borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(_controller);
  }

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
                          child: AnimatedBuilder(
                              animation: _borderRadius,
                              builder: (context, child) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://i.pravatar.cc/300"),
                                    ),
                                    borderRadius: _borderRadius.value,
                                  ),
                                );
                              }),
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
                      title: ('Tamaño de fuente'),
                      content: Column(
                        children: <Widget>[
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Texto Grande",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Divider(),
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Texto mediano",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Divider(),
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Texto pequeño",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
