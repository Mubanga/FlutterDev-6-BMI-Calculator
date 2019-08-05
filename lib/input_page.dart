import 'package:flutter/material.dart';

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
          Expanded(flex: 3, child: SingleDetailCard()),
          Expanded(flex: 3, child: MultipleDetailCards(2))
        ],
      ),
    );
  }

  Container SingleDetailCard() {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color(0xFF1D1E33), borderRadius: BorderRadius.circular(10.00)),
    );
  }

  Container TwoDetailCard() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SingleDetailCard(),
          ),
          Expanded(
            flex: 2,
            child: SingleDetailCard(),
          )
        ],
      ),
    );
  }

  Container MultipleDetailCards(int CardNumber) {
    List<Expanded> _NumberOfCards = [];
    for (int x = 0; x < CardNumber; x++) {
      Expanded card = Expanded(flex: CardNumber, child: SingleDetailCard());
      _NumberOfCards.add(card);
    }
    return Container(
      child: Row(
        children: _NumberOfCards,
      ),
    );
  }
}
