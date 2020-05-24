import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Bibliotek/Models/Options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:provider/provider.dart';
import 'package:Bibliotek/blocs/them.dart';
import 'package:toast/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();

  AuthCredential authCredential;


  int _selectedOption = 0;
  File imageFile;
  String urlImage;


  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    oldPass.dispose();
    newPass.dispose();
    confirmPass.dispose();
    super.dispose();
  }

  void _openGallery(BuildContext context) async {
    File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    final StorageReference _storageRef = _storage.ref();
    this.setState(() {
      imageFile = picture;
      _auth.currentUser().then((user)=>{
        _storageRef.child("${user.uid}.jpg").putFile(imageFile)
      });
    });
    getUrl();
    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    File picture = await ImagePicker.pickImage(source: ImageSource.camera);
    final StorageReference _storageRef = _storage.ref();
    this.setState(() {
      imageFile = picture;
      _auth.currentUser().then((user)=>{
        _storageRef.child("${user.uid}.jpg").putFile(imageFile)
      });
    });
    getUrl();
    Navigator.pop(context);
  }


  getUrl() async {
    final FirebaseUser user = await _auth.currentUser();
    _storage.ref().child('${user.uid}.jpg').getDownloadURL().then((url) {
      setState(() {
        urlImage = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getUrl();
    final theme = Provider.of<ThemeChanger>(context);
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
                        backgroundImage:
                            NetworkImage("${urlImage}"),
                        minRadius: 1,
                        maxRadius: 30,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Configuración",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 2,
                        ))
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: ListView.builder(
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
                      //color: Colors.white,
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
                          color: _selectedOption == index - 1
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                      selected: _selectedOption == index - 1,
                      onTap: () {
                        setState(() {
                          _selectedOption = index - 1;
                        });
                        switch (index - 1) {
                          case 0:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("¿De donde quieres traer la foto?"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Text("Galeria"),
                                          onTap: () {
                                            _openGallery(context);
                                          },
                                        ),
                                      Padding(padding: EdgeInsets.all(8.0)),
                                      GestureDetector(
                                        child: Text("Camara"),
                                        onTap: () {
                                          _openCamera(context);
                                        },
                                      )
                                    ],
                                  ),
                                ));
                            });
                            break;
                          case 1:
                            Alert(
                                context: context,
                                title: "Cambiar contraseña",
                                content: Column(
                                  children: <Widget>[
                                    TextField(
                                      controller: oldPass,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        labelText: 'antigua contraseña',
                                      ),
                                    ),
                                    TextField(
                                      controller: confirmPass,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        labelText: 'confirmar contraseña',
                                      ),
                                    ),
                                    TextField(
                                      controller: newPass,
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
                                    onPressed: () async {
                                      if (oldPass.text == confirmPass.text) {
                                        _auth.currentUser().then((user) async {
                                          authCredential = EmailAuthProvider.getCredential(
                                            email: user.email,
                                            password: oldPass.text,
                                          );
                                          try{
                                            user.reauthenticateWithCredential(authCredential).then((auth)=>{
                                              user.updatePassword(newPass.text).then((pass)=>{
                                                debugPrint("Actualizado"),
                                              }).catchError((onError)=>{
                                                Toast.show("La contraseña es erronea", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER)
                                              })
                                            });
                                          } catch (e){
                                            Toast.show("La contraseña es erronea", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                                          }
                                        });
                                      } else {
                                        Toast.show("Las contraseñas no coinciden", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cambiar",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ]).show();
                            break;
                          case 2:
                            break;
                          case 3:
                            Alert(
                                context: context,
                                title: "Cambiar tema",
                                content: Column(
                                  children: <Widget>[
                                    FlatButton(
                                      child: Text('Claro'),
                                      onPressed: () => theme.setTheme(ThemeData(
                                        primarySwatch: Colors.blue,
                                        primaryColor: Colors.indigo,
                                        accentColor: Colors.indigoAccent,
                                        textTheme: TextTheme(
                                          headline: TextStyle(
                                              fontSize: 36.0,
                                              color: Colors.black),
                                          body2: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black),
                                        ),
                                      )),
                                    ),
                                    FlatButton(
                                      child: Text('Oscuro'),
                                      onPressed: () => theme.setTheme(ThemeData(
                                        brightness: Brightness.dark,
                                        primarySwatch: Colors.blue,
                                        primaryColor: Colors.black,
                                        accentColor: Colors.indigoAccent,
                                        textTheme: TextTheme(
                                          headline: TextStyle(
                                              fontSize: 36.0,
                                              color: Colors.white),
                                          body2: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white),
                                        ),
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
                                                textTheme: TextTheme(
                                                  headline: TextStyle(
                                                      fontSize: 36.0,
                                                      color: Colors.black),
                                                  body2: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black),
                                                ),
                                                // cardTheme: CardTheme(shadowColor: Colors.teal,elevation: 9.0),
                                              ),
                                            )),
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () => {
                                      Navigator.pop(context)
                                    },
                                    child: Text(
                                      "Cambiar",
                                      style: TextStyle(
                                          ),
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
        ));
  }
}
