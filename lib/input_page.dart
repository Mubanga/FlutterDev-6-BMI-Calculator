import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'single_detail_card.dart';
import 'icon_detail.dart';

const BOTTOM_CONTAINER_HEIGHT = 80.0;
const ACTIVE_CARD_COLOUR = Color(0xFF1D1E33);
const INACTIVE_CARD_COLOUR = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = INACTIVE_CARD_COLOUR;
  Color femaleCardColour = INACTIVE_CARD_COLOUR;
  int _currentGenderSelection = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(
                        colour: COLOUR_DETAIL_CARD,
                        cardChild: IconDetail(
                            displayIcon: FontAwesomeIcons.mars,
                            descriptionText: "MALE"),
                      )),
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(
                        colour: COLOUR_DETAIL_CARD,
                        cardChild: IconDetail(
                            displayIcon: FontAwesomeIcons.venus,
                            descriptionText: "FEMALE"),
                      ))
                ],
              )),
          Expanded(
              flex: 3, child: SingleDetailCard(colour: COLOUR_DETAIL_CARD)),
          Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(colour: COLOUR_DETAIL_CARD)),
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(colour: COLOUR_DETAIL_CARD))
                ],
              )),
          Container(
            color: COLOUR_BOTTOM_CONTAINER,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: BOTTOM_CONTAINER_HEIGHT,
          )
        ],
      ),
    );
  }

  Container MultipleDetailCards(int CardNumber) {
    List<Expanded> _NumberOfCards = [];
    for (int x = 0; x < CardNumber; x++) {
      Expanded card = Expanded(
          flex: CardNumber,
          child: SingleDetailCard(colour: COLOUR_DETAIL_CARD));
      _NumberOfCards.add(card);
    }
    return Container(
      child: Row(
        children: _NumberOfCards,
      ),
    );
  }

  void updateGenderSelection() {}
}
