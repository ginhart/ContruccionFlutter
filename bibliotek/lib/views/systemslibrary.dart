import 'package:bibliotek/functions/BeautyTextfield.dart';
import 'package:bibliotek/views/book.dart';
import 'package:bibliotek/views/dummy/carrera.dart';
import 'package:flutter/material.dart';

class SystemsLibrary extends StatefulWidget {

    SystemsLibrary({
    @required this.isInDualPanelLayout,
    @required this.card,
  });


   bool isInDualPanelLayout;
   Carrera card;

  @override
  _SystemsLibraryState createState() => _SystemsLibraryState();

}

class _SystemsLibraryState extends State<SystemsLibrary> {

  Widget _inputsearch=new Container(); 

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
    
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _inputsearch=
                BeautyTextfield(
                width: double.maxFinite,
                height: 60,
                maxLines: 1,
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.text,
                placeholder: "...",
                prefixIcon: Icon(Icons.search),
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
              );
              });
            },
          ),
          // action button

          // overflow menu
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              _inputsearch,
              Text(
                widget.card?.tituloCarrera?? "seleccione una carrera" ,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
              
              GestureDetector(
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        widget.card?.imagenLibro?? "assets/images/no-image-available-sign-internet-260nw-261719003.jpg",
                        height: 100,
                      ),
                      Text(
                        widget.card?.tituloLibro?? "seleccione una carrera",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Book()),
                  );
                },
              )
            ],
          )),
        ),
      ),
    ));
  }
}
