// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class reusable extends StatelessWidget {
  final Color kolor;
  final Widget cardChild;
  reusable({required this.kolor, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kolor,
      ),
    );
  }
}
