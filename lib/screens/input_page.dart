import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components//single_detail_card.dart';
import 'package:bmi_calculator/components/icon_detail.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/calculator_model.dart';

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
          /**
           * Bottom Button
           */
          BottomButton(
            buttonText: "CALCULATE",
            onClick: () {
              final _BMI_Info = CalculatorModel(_height, _weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    BMI: _BMI_Info.getBMI(),
                    BMIInterpretation: _BMI_Info.getInterpretation(),
                    BMIResult: _BMI_Info.getResult(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
