import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'single_detail_card.dart';
import 'icon_detail.dart';
import 'constants.dart';

enum Gender {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  Gender _currentGenderSelection;
  int _height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /**
           * Gender Widgets
           */
          Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  /**
                   * MALE Gender Detail Card
                   */
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(
                        onPress: () {
                          setState(() {
                            _currentGenderSelection = Gender.MALE;
                          });
                        },
                        colour: _currentGenderSelection == Gender.MALE
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconDetail(
                            displayIcon: FontAwesomeIcons.mars,
                            descriptionText: "MALE"),
                      )),
                  /**
                   * FEMALE Gender Detail Card
                   */
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(
                        onPress: () {
                          setState(() {
                            _currentGenderSelection = Gender.FEMALE;
                          });
                        },
                        colour: _currentGenderSelection == Gender.FEMALE
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconDetail(
                            displayIcon: FontAwesomeIcons.venus,
                            descriptionText: "FEMALE"),
                      ))
                ],
              )),
          /**
           *  Height Widget
           */
          Expanded(
              flex: 3,
              child: SingleDetailCard(
                colour: kColourDetailCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kTextStyleLabel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          _height.toString(),
                          style: kTextStyleNumbers,
                        ),
                        Text(
                          "cm",
                          style: kTextStyleLabel,
                        ),
                      ],
                    ),
                    Slider(
                        value: _height.toDouble(),
                        min: 120,
                        max: 240,
                        activeColor: kSliderActiveColour,
                        inactiveColor: kSliderInActiveColour,
                        onChanged: (double sliderHeight) {
                          setState(() {
                            _height = sliderHeight.round();
                          });
                        })
                  ],
                ),
              )),
          /**
           *  Age and Weight Widgets
           */
          Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(colour: kColourDetailCard)),
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(colour: kColourDetailCard))
                ],
              )),
          Container(
            color: kColourBottomContainer,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }

  Container MultipleDetailCards(int CardNumber) {
    List<Expanded> _NumberOfCards = [];
    for (int x = 0; x < CardNumber; x++) {
      Expanded card = Expanded(
          flex: CardNumber, child: SingleDetailCard(colour: kColourDetailCard));
      _NumberOfCards.add(card);
    }
    return Container(
      child: Row(
        children: _NumberOfCards,
      ),
    );
  }

  void updateGenderSelection() {
    if (_currentGenderSelection == Gender.MALE) {
      maleCardColour = kActiveCardColour;
      femaleCardColour = kInactiveCardColour;
    } else if (_currentGenderSelection == Gender.FEMALE) {
      maleCardColour = kInactiveCardColour;
      femaleCardColour = kActiveCardColour;
    }
  }
}
