import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onClick;

  BottomButton({@required this.buttonText, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        color: kColourBottomContainer,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(buttonText, style: kTextStyleLargeButton)),
      ),
    );
  }
}
