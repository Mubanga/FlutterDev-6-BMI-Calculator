import 'package:flutter/material.dart';
import 'constants.dart';

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
          style: kTextStyleLabel,
        )
      ],
    );
  }
}
