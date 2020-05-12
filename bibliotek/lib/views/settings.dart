import 'package:flutter/material.dart';
import 'package:Bibliotek/Models/Options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Configuración'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Card(
                child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                      minRadius: 1,
                      maxRadius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Configuracion",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 2,
                    )
                  )
                ],
              ),
            ),
            ),
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: 
              ListView.builder(
                itemCount: options.length + 2,
                itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(height: 15.0);
                } else if (index == options.length + 1) {
                  return SizedBox(height: 100.0);
                }
              return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: _selectedOption == index - 1
                  ? Border.all(color: Colors.black26)
                  : null,
                ),
              child: ListTile(
                leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                      ? Colors.black
                      : Colors.grey[600],
                ),
              ),
              subtitle: Text(
                options[index - 1].subtitle,
                style: TextStyle(
                  color:
                      _selectedOption == index - 1 ? Colors.black : Colors.grey,
                ),
              ),
              selected: _selectedOption == index - 1,
              onTap: () {
                setState(() {
                  _selectedOption = index - 1;
                });
                switch (index - 1) {
                  case 1:
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
                          onPressed: () => {
                            //Cambio de contraseña aqui
                            Navigator.pop(context)
                          },
                          child: Text(
                            "Cambiar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                    break;
                  default:
                }
              },
            ),
          );
        },
      ),
            )
          ],
        )
    );
  }
}
