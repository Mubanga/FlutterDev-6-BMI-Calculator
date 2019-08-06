import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /**
           * Title Text
           */
          Expanded(
            child: Text(
              "Your Result",
              style: kTextStyleTitle,
            ),
          ),
          /**
           * BMI Results Card
           */
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kActiveCardColour),
                child: Column(
                  //      mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Current BMI Result",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "[NUMBER HERE]",
                      style: kTextStyleNumbers,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac quam quam. Etiam rhoncus tortor in pharetra laoreet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 15.0,
          ),
          /**
           * RE-CALCULATE Button
           */
          Expanded(
            child: BottomButton(
                buttonText: "RE-CALCULATE",
                onClick: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
