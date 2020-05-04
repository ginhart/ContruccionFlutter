import 'package:bibliotek/functions/BeautyTextfield.dart';
import 'package:bibliotek/views/principalpage.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('BiblioteK'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Bienvenido a la BiblioteK',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Open Sans',
                        fontSize: 25),
                  ),
                  Image.network(
                    "https://desparchado.co/media/organizers/Konrad_Lorenz.png",
                  ),
                  BeautyTextfield(
                    width: double.maxFinite,
                    height: 60,
                    duration: Duration(milliseconds: 300),
                    inputType: TextInputType.text,
                    prefixIcon: Icon(Icons.email),
                    placeholder: "Correo Institucional",
                    backgroundColor: Colors.white54,
                    onTap: () {
                      print('Click');
                    },
                    onChanged: (text) {
                      print(text);
                    },
                    onSubmitted: (data) {
                      print(data.length);
                    },
                    obscureText: false,
                  ),
                  BeautyTextfield(
                    width: double.maxFinite,
                    height: 60,
                    maxLines: 1,
                    duration: Duration(milliseconds: 300),
                    inputType: TextInputType.visiblePassword,
                    obscureText: true,
                    prefixIcon: Icon(Icons.lock_outline),
                    placeholder: "Contraseña",
                    backgroundColor: Colors.white54,
                    onTap: () {
                      print('Click');
                    },
                    onChanged: (text) {
                      print(text);
                    },
                    onSubmitted: (data) {
                      print(data.length);
                    },
                  ),
                  NiceButton(
                    width: 255,
                    elevation: 8.0,
                    radius: 52.0,
                    text: "Entrar",
                    background: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrincipalPage()),
                      );
                    },
                  ),
                ],
              ),
            )),
          )),
    );
  }
}