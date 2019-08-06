import 'package:flutter/material.dart';
import 'constants.dart';

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
                        fontSize: 15.0,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "[NUMBER HERE]",
                      style: kTextStyleNumbers,
                    ),
                    Text(
                      "Lorem Ipsum Carpe Diem A Whole Bunch Of Latin Words Go Here",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
              )),
          /**
           * RE-CALCULATE Button
           */
          Expanded(
              child: Container(
            color: kColourBottomContainer,
            width: double.infinity,
            child: Center(
              child: Text(
                "RE-CALCULATE",
                style: kTextStyleLargeButton,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
