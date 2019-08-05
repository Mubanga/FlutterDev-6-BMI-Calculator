import 'package:flutter/material.dart';

class SingleDetailCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  SingleDetailCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.00)),
    );
  }
}
