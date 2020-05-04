import 'package:flutter/material.dart';

class Carrera{
  String imagenCarrera;
  String tituloCarrera;
  String imagenLibro;
  String tituloLibro;

  Carrera({@required this.imagenCarrera,@required this.tituloCarrera,this.imagenLibro,this.tituloLibro});
}

List<Carrera> dataDummy = <Carrera>[

  new Carrera(
    imagenCarrera: 'assets/images/psicologia.png',
    tituloCarrera: 'Psicologia',
    imagenLibro: 'assets/images/psicologia.jpg',
    tituloLibro: 'Psicologia de la mente'
  ),

    new Carrera(
    imagenCarrera: 'assets/images/negocios.png',
    tituloCarrera: 'Negocios',
    imagenLibro:   'assets/images/negocios.jpeg',
    tituloLibro:   'Negocios internacionales'
  ),

    new Carrera(
    imagenCarrera: 'assets/images/mercadeo.png',
    tituloCarrera: 'Mercadeo',
    imagenLibro: 'assets/images/indice.jpeg',
    tituloLibro: 'MItos y leyendas del mercadeo'
  ),

    new Carrera(
    imagenCarrera: 'assets/images/matematicas.png',
    tituloCarrera: 'Matematicas',
    imagenLibro: 'assets/images/matematicas.jpeg',
    tituloLibro: 'Precalculo'
  ),

    new Carrera(
    imagenCarrera: 'assets/images/ing_sistemas.png',
    tituloCarrera: 'Ing_sistemas',
    imagenLibro: 'assets/images/sistemas.jpg',
    tituloLibro: 'Intrduccion a la ing sistemas'
  ),

    new Carrera(
    imagenCarrera: 'assets/images/ing_industrial.jpg',
    tituloCarrera: 'Ing_industrial',
    imagenLibro: 'assets/images/industrial.jpeg',
    tituloLibro: 'Ing- industrial'
  ),

  
];