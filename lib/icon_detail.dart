import 'package:flutter/material.dart';

const COLOUR_BOTTOM_CONTAINER = Color(0xFFEB1555);
const COLOUR_DETAIL_CARD = Color(0xFF1D1E33);
const COLOUR_TEXT_DETAIL_CARD = Color(0xFF8D8E98);
const labelTextStyle =
    TextStyle(color: COLOUR_TEXT_DETAIL_CARD, fontSize: 18.00);

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
          style: labelTextStyle,
        )
      ],
    );
  }
}
