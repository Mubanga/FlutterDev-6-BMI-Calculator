import 'package:flutter/material.dart';

const BOTTOM_CONTAINER_HEIGHT = 80.0;
const COLOUR_BOTTOM_CONTAINER = Color(0xFFEB1555);
const COLOUR_DETAIL_CARD = Color(0xFF1D1E33);

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
          Expanded(flex: 3, child: MultipleDetailCards(2)),
          Expanded(flex: 3, child: SingleDetailCard(COLOUR_DETAIL_CARD)),
          Expanded(flex: 3, child: MultipleDetailCards(2)),
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

  Container SingleDetailCard(Color colour) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.00)),
    );
  }


  Container MultipleDetailCards(int CardNumber) {
    List<Expanded> _NumberOfCards = [];
    for (int x = 0; x < CardNumber; x++) {
      Expanded card = Expanded(
          flex: CardNumber, child: SingleDetailCard(COLOUR_DETAIL_CARD));
      _NumberOfCards.add(card);
    }
    return Container(
      child: Row(
        children: _NumberOfCards,
      ),
    );
  }
}
