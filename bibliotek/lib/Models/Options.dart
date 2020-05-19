import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.person, size: 40.0),
    title: 'Foto de perfil',
    subtitle: 'Cambia tu foto de perfil.',
  ),
  Option(
    icon: Icon(Icons.lock, size: 40.0),
    title: 'Contraseña',
    subtitle: 'Cambia tu contraseña de ingreso a la app.',
  ),
  Option(
    icon: Icon(Icons.notifications, size: 40.0),
    title: 'Notificaciones',
    subtitle: 'Activa o desactiva las notificaciones.',
  ),
  Option(
    icon: Icon(Icons.color_lens, size: 40.0),
    title: 'Tema',
    subtitle: 'Cambia los colores de la app.',
    
  ),
];