
import 'package:bibliotek/views/dummy/carrera.dart';
import 'package:bibliotek/views/principalMultipantalla.dart';
import 'package:bibliotek/views/systemslibrary.dart';
import 'package:flutter/material.dart';


class MasterDetailContainer extends StatefulWidget {
  @override
  _ItemMasterDetailContainerState createState() =>
      _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer> {
  static const int kDualPanelBreakpoint = 600;

  Carrera _selectedCard;

  Widget _buildSinglePanelLayout() {
    return CarrerasClass(
      carreraSelectedCallback: (card) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SystemsLibrary(
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
            child: CarrerasClass(
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
          child: SystemsLibrary(
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
