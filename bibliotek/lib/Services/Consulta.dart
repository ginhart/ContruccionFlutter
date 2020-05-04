
import 'package:cloud_firestore/cloud_firestore.dart';

class Consulta{

final Firestore _db = Firestore.instance;

Stream<QuerySnapshot> buscarLibrosFiltrados(String facultad){
        return _db.collection('Libros').where('Facultad', isEqualTo: facultad).snapshots();

}

}