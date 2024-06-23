import 'package:bmi_calculator/const.dart';
import 'package:bmi_calculator/extract_button.dart';
import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'input_page.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.bmiresult,
      required this.actualbmireultvalue,
      required this.interpretation});

  final String bmiresult;
  final String actualbmireultvalue;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kTitleTeststyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusable(
              kolor: Color(0xFF101F33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiresult,
                    style: kNormalTextstyle,
                  ),
                  Text(
                    actualbmireultvalue,
                    style: kLargeTextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kInterperterText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Bottombutton(
              buttonName: 'RECALCULATE', onPressed: Navigator.of(context).pop)
        ],
      ),
    );
  }
}
