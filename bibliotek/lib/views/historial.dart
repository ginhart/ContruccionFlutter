import 'package:animate_do/animate_do.dart';
import 'package:bibliotek/views/dummy/carrera.dart';
import 'package:bibliotek/views/dummy/historial.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Historial extends StatefulWidget {
  Historial({
    @required this.isInDualPanelLayout,
    @required this.card,
  });

  bool isInDualPanelLayout;
  Libro card;

  @override
  _HistorialState createState() => _HistorialState();
}


class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('BiblioteK'),
            ),
            body: SingleChildScrollView(
              // Los hijos dentro de card en columnas, debajo de otro
              child: new Column(
                children: <Widget>[
                  // Agregamos una imagen consumida desde internet
                  FadeInDown(
                    child: Image.asset(
                      widget.card?.imagenLibro ??
                          "assets/images/no-image-available-sign-internet-260nw-261719003.jpg",
                    ),
                    duration: Duration(milliseconds: 800),
                    from: 20.1,
                  ),
                  // Agregamos un contenedor para el texto
                  new Container(
                      padding: const EdgeInsets.all(10), // Un padding para todo
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Nombre del libro:",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.card?.nombre ?? "Seleccione un libro"),
                          Text(
                            "Autor del libro:",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.card?.autor ?? ""),
                          Text(
                            "Editorial del libro:",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.card?.editorial ?? ""),
                          Text(
                            "Paginas del libro :",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.card?.paginas ?? ""),
                          Text(
                            "Disponibilidad del libro :",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.card?.disponibilidad ?? ""),
                          Text(
                            "Tiempo restante del libro :",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.card?.tiempoRestante ?? ""),
                        ],
                      )),
                  new Padding(
                      // Esta seccion sera para los botones de acciones
                      padding: new EdgeInsets.all(
                          7.0), // Un padding general entre cada elemento
                      child: new Row(
                        // mainAxisAlignment permite alinear el contenido dentro de Row
                        // en este caso le digo que use spaceBetwee, esto hara que
                        // cualquier espacio horizontal que no se haya asignado dentro de children
                        // se divida de manera uniforme y se coloca entre los elementos secundarios.
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: <Widget>[
                                  FadeInDown(
                                    child: IconButton(
                                      icon: Icon(Icons.favorite),
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.success,
                                          title: "Agregar a favoritos",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Aceptar",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            ),
                                            DialogButton(
                                              child: Text("Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20)),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      },
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                  FadeInUp(
                                    child: Text('Agregar a Favoritos'),
                                  ),
                                  // Agregamos los botones de tipo Flat, un icono, un texto y un evento
                                  // new FlatButton.icon(
                                  //   // Un icono puede recibir muchos atributos, aqui solo usaremos icono, tamaño y color
                                  //   icon: const Icon(Icons.favorite, size: 15.0, color: Colors.redAccent,  ),
                                  //   label: const Text('Agregar a Favoritos',textScaleFactor: 0.7,),
                                  //   // Esto mostrara 'Me encanta' por la terminal

                                  // ),
                                  FadeInDown(
                                    child: IconButton(
                                      icon: Icon(Icons.star),
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.success,
                                          title: "Agregar a Deseados",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Aceptar",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            ),
                                            DialogButton(
                                              child: Text("Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20)),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      },
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                  FadeInUp(
                                    child: Text('Agregar a Deseados'),
                                  ),

                                  // new FlatButton.icon(
                                  //   icon: const Icon(Icons.share,
                                  //       size: 15.0, color: Colors.blueAccent),
                                  //   label: const Text(
                                  //     'Compartir',
                                  //     textScaleFactor: 0.7,
                                  //   ),
                                  //   onPressed: () {
                                  //     print('Compartelo');
                                  //   },
                                  // )
                                ],
                              ))
                        ],
                      ))
                ],
              ),
            )));
  }
}
