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

class HistorialC {
  String title, writer, editorial, image, time;
  int pages, disponibilidad;

  HistorialC(this.title, this.writer, this.editorial, this.pages, this.image,
      this.disponibilidad, this.time);
  /*  BookC book('Android Studio', 'Jesus Tomas, Vicente Carbonell',
      'Marcombo', 300, 'https://images-na.ssl-images-amazon.com/images/I/7139EcoIUpL.jpg',1,'00:00');*/
}

class _HistorialState extends State<Historial> {@override
  Widget build(BuildContext context) {
    return Container( 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BiblioteK'),
        ),
        body:Card(
      // Los hijos dentro de card en columnas, debajo de otro
      child: new Column(
        children: <Widget>[
          // Agregamos una imagen consumida desde internet
           FadeInDown(child:  Image.asset(widget.card?.imagenLibro?? "assets/images/no-image-available-sign-internet-260nw-261719003.jpg",),duration: Duration(milliseconds: 800),from: 20.1,),
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
            Text(widget.card?.nombre?? "Seleccione un libro"),
            Text(
               "Autor del libro:",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.card?.autor?? ""),
             Text(
               "Esitorial del libro:",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.card?.editorial?? ""),
             Text(
               "Paginas del libro :",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.card?.paginas?? ""),
             Text(
               "Disponibilidad del libro :",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.card?.disponibilidad?? ""),
             Text(
               "Tiempo restante del libro :",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.card?.tiempoRestante?? ""),
            
              ],
            )
             
          ),
          new Padding(
            // Esta seccion sera para los botones de acciones
            padding: new EdgeInsets.all(7.0), // Un padding general entre cada elemento
            child: new Row(
              // mainAxisAlignment permite alinear el contenido dentro de Row
              // en este caso le digo que use spaceBetwee, esto hara que
              // cualquier espacio horizontal que no se haya asignado dentro de children
              // se divida de manera uniforme y se coloca entre los elementos secundarios.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Agregamos los botones de tipo Flat, un icono, un texto y un evento
                new FlatButton.icon(
                  // Un icono puede recibir muchos atributos, aqui solo usaremos icono, tamaño y color
                  icon: const Icon(Icons.favorite, size: 15.0, color: Colors.redAccent,  ),
                  label: const Text('Agregar a Favoritos',textScaleFactor: 0.7,),
                  // Esto mostrara 'Me encanta' por la terminal
                  onPressed: () {
                    Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Agregar a favoritos",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Aceptar",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      ),
                      DialogButton(child: Text("Canacelar",style: TextStyle(color: Colors.black, fontSize: 20)),
                      onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                  },
                ),
                new FlatButton.icon(
                  icon: const Icon(Icons.star, size: 15.0, color: Colors.green),
                  label: const Text(' deseados',textScaleFactor: 0.8,),
                  onPressed: () {
                    Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Agregar a Deseados",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Aceptar",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      ),
                      DialogButton(child: Text("Canacelar",style: TextStyle(color: Colors.black, fontSize: 20)),
                      onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                  },
                ),
                new FlatButton.icon(
                  icon: const Icon(Icons.share, size: 15.0, color: Colors.blueAccent),
                  label: const Text('Compartir',textScaleFactor: 0.7,),
                  onPressed: () {
                    print('Compartelo');
                  },
                )
              ],
            )
          )
        ],
      ),
    )              
    ));
  }
}
