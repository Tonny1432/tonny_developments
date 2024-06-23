// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'reusable.dart';
import 'const.dart';
import 'reusable.dart';
import 'resultpage.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({required this.buttonName, required this.onPressed});
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            'CALCULATE',
            style: bottomContainerTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.only(bottom: 10),
        color: bottomContainerColor,
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
