import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const BOTTOM_CONTAINER_HEIGHT = 80.0;
const COLOUR_BOTTOM_CONTAINER = Color(0xFFEB1555);
const COLOUR_DETAIL_CARD = Color(0xFF1D1E33);
const COLOUR_TEXT_DETAIL_CARD = Color(0xFF8D8E98);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                          descriptionText: "MALE",
                        ),
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
}

class IconDetail extends StatelessWidget {
  final String descriptionText;
  final IconData displayIcon;

  IconDetail({@required this.displayIcon, @required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          displayIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          descriptionText,
          style: TextStyle(color: COLOUR_TEXT_DETAIL_CARD, fontSize: 18.00),
        )
      ],
    );
  }
}

class SingleDetailCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  SingleDetailCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.00)),
    );
  }
}
