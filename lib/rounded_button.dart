import 'package:flutter/material.dart';
import 'constants.dart';

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
