import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class PushNotificationProvider {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;


  initNotifications(){


    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token){
      //token e3eHCL8taU0:APA91bFY5TDzTQM9Hq9cdM72F8yqRg5dIe8jTfGSBho922Gyz0ZI4WjJkE66W7hOucH7C50uJ2H3PIjGNpjccQhoAexG79PYskDxKlKazI1stRHvL8suvHW1wt_1Wx0OBzhVJd_3hgFV
      //dms5D3iY1f4:APA91bEpsUZMo3OVD2_K8ws3a8t2CMtRtzXrgs-GfEUMtmdShrj4vXk1JtJ_Nz9GlbC4kn2LIvUrCIwu4Cs8JgZzoWlz4e-m_my_m5Il19Pk_Zzvz-fbdiPct9XjKdhjT2F1T6qQ-CkY
      debugPrint(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        String argumento = 'no-data';
        if(Platform.isAndroid){
          argumento = message['data']['pagina'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        String argumento = 'no-data';
        if(Platform.isAndroid){
          argumento = message['data']['pagina'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
    );
  }


  Dispose(){
    _mensajesStreamController?.close();
  }
}