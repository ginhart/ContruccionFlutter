import 'package:bibliotek/views/dummy/historial.dart';
import 'package:bibliotek/views/historial.dart';
import 'package:bibliotek/views/historyMultipantalla.dart';
import 'package:flutter/material.dart';
import 'package:bibliotek/views/dummy/carrera.dart';
class MasterDetailContainer2 extends StatefulWidget {
  @override
  _ItemMasterDetailContainerState createState() =>
      _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer2> {
  static const int kDualPanelBreakpoint = 600;

  Libro _selectedCard;

  Widget _buildSinglePanelLayout() {
    return HistoryClass(
      carreraSelectedCallback: (card) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Historial(
                isInDualPanelLayout: false,
                card: card,
              );
            },
          ),
        );
      },
    );
  }
  Widget _buildDualPanelLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex:1,
          child: Material(
            elevation: 3.0,
            child: HistoryClass(
              carreraSelectedCallback: (card) {
                setState(() {
                  _selectedCard = card;
                });
              },
              selectedCarrera: _selectedCard,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Historial(
            isInDualPanelLayout: true,
            card: _selectedCard,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < kDualPanelBreakpoint) {
      content = _buildSinglePanelLayout();
    } else {
       content = _buildDualPanelLayout();
    }

    return Scaffold(
      body: content,
    );
  }
}
