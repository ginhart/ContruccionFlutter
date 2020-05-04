import 'package:flutter/material.dart';

class Libro{
  String imagenLibro;
  String nombre;
  String autor;
  String editorial;
  String paginas;
  String disponibilidad;
  String tiempoRestante;
  

  Libro({@required this.imagenLibro,@required this.nombre,this.autor,this.editorial,this.paginas,this.disponibilidad,this.tiempoRestante});
}

List<Libro> dataDummyLibro = <Libro>[

  new Libro(
    imagenLibro: 'assets/images/negocios.jpeg',
    nombre: 'Negocos internacionales',
    autor: 'Naruto uzumaki',
    editorial: 'Marcombo',
    paginas: '400',
    disponibilidad: '2',
    tiempoRestante: "3:00"
  ),


  new Libro(
    imagenLibro: 'assets/images/industrial.jpeg',
    nombre: 'ing-indistrial',
    autor: 'Marggyth',
    editorial: 'los tres senderos de los angeles',
    paginas: '600',
    disponibilidad: '0',
    tiempoRestante: "00:00"
  ),


  new Libro(
    imagenLibro: 'assets/images/sistemas.jpg',
    nombre: 'Introducion a la ingenieria de sistemas',
    autor: 'Zayri',
    editorial: 'amateratsu',
    paginas: '1000',
    disponibilidad: '4',
    tiempoRestante: "13:00"
  ),

  new Libro(
    imagenLibro: 'assets/images/indice.jpeg',
    nombre: 'Mitos y leyendas del mercadeo',
    autor: 'Kakashi sensei',
    editorial: 'Konoha',
    paginas: '900',
    disponibilidad: '1',
    tiempoRestante: "19:00"
  ),
];