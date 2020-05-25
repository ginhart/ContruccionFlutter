
import 'package:cloud_firestore/cloud_firestore.dart';
import '../functions/Global.dart' as Global;

class Consulta{

final Firestore _db = Firestore.instance;


Stream<QuerySnapshot> buscarLibrosFiltrados(String facultad){
        return _db.collection('Libros').where('Facultad', isEqualTo: facultad).snapshots();

}

Stream<QuerySnapshot> traerLibrosBuscados(){
  return _db.collection('Libros').snapshots();
}

Stream<DocumentSnapshot> estaEnFavoritos(String libro){
  return _db.collection('Usuarios').document(Global.user.id).collection('Favoritos').document(libro).snapshots();
}

Stream<DocumentSnapshot> estaEnDeseados(String libro){
  return _db.collection('Usuarios').document(Global.user.id).collection('Deseados').document(libro).snapshots();
}

}