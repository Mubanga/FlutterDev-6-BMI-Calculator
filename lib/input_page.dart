import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'single_detail_card.dart';
import 'icon_detail.dart';
import 'constants.dart';
import 'results_page.dart';

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
  int _weight = 60;
  int _age = 18;

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
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: kSliderActiveColour,
                          overlayColor: kSliderOverlayColour,
                          inactiveTrackColor: kSliderInActiveColour,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: _height.toDouble(),
                          min: kMIN_HEIGHT,
                          max: kMAX_HEIGHT,
                          onChanged: (double sliderHeight) {
                            setState(() {
                              _height = sliderHeight.round();
                            });
                          }),
                    )
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
                  /**
                   * WEIGHT
                   */
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(
                        colour: kColourDetailCard,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: kTextStyleLabel,
                            ),
                            Text(
                              _weight.toString(),
                              style: kTextStyleNumbers,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedButton(
                                  icon: Icons.add,
                                  colour: Colors.white,
                                  onClick: () {
                                    setState(() {
                                      _weight++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RoundedButton(
                                  icon: Icons.remove,
                                  colour: Colors.white,
                                  onClick: () {
                                    setState(() {
                                      _weight--;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  /**
                   * AGE
                   */
                  Expanded(
                      flex: 2,
                      child: SingleDetailCard(
                        colour: kColourDetailCard,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("AGE", style: kTextStyleLabel),
                            Text(_age.toString(), style: kTextStyleNumbers),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedButton(
                                    icon: Icons.add,
                                    colour: kColourRoundedButton,
                                    onClick: () {
                                      setState(() {
                                        _age++;
                                      });
                                    }),
                                SizedBox(width: 20.0),
                                RoundedButton(
                                    icon: Icons.remove,
                                    colour: kColourRoundedButton,
                                    onClick: () {
                                      setState(() {
                                        _age--;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage();
              }));
            },
            child: Container(
              color: kColourBottomContainer,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                  child: Text("CALCULATE", style: kTextStyleLargeButton)),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Color colour;
  final Function onClick;

  RoundedButton(
      {@required this.icon, @required this.colour, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0.0,
        constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
        fillColor: kColourRoundedButton,
        shape: CircleBorder(),
        child: Icon(icon),
        onPressed: onClick);
  }
}
