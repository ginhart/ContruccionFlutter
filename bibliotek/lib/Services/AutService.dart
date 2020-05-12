import 'package:Bibliotek/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Autentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  Future<AuthResult> registers(User user, String password){
  return _auth.createUserWithEmailAndPassword(email: user.correo, password: password);
  }
  Future login(String correo, String password){
  return _auth.signInWithEmailAndPassword(email: correo, password: password);
  }

  Future logout(){
    return _auth.signOut();
  }
}