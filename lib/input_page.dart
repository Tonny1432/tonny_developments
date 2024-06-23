import 'dart:ui';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'icondetails.dart';
import 'const.dart';
import 'extract_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 12;
  Color maleInactiveColor = inactiveContainerColor;
  Color femaleInactiveColor = inactiveContainerColor;

  void changeColor(int gender) {
    //male =1, female=2
    if (gender == 1) {
      if (maleInactiveColor == inactiveContainerColor) {
        maleInactiveColor = reusableColor;
        femaleInactiveColor = inactiveContainerColor;
      } else {
        maleInactiveColor = inactiveContainerColor;
      }
    }
    if (gender == 2) {
      if (femaleInactiveColor == inactiveContainerColor) {
        femaleInactiveColor = reusableColor;
        maleInactiveColor = inactiveContainerColor;
      } else {
        femaleInactiveColor = inactiveContainerColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(1);
                      });
                    },
                    child: reusable(
                      cardChild: iconDetails(
                        icon: FontAwesomeIcons.mars,
                        lable: 'MALE',
                      ),
                      kolor: maleInactiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColor(2);
                      });
                    },
                    child: reusable(
                      cardChild: iconDetails(
                        icon: FontAwesomeIcons.venus,
                        lable: 'FEMALE',
                      ),
                      kolor: femaleInactiveColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: reusable(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'HEIGHT',
                    style: lableStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberStyle,
                      ),
                      const Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 250,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              kolor: reusableColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusable(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: lableStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    kolor: reusableColor,
                  ),
                ),
                Expanded(
                  child: reusable(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: lableStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    kolor: reusableColor,
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(
            buttonName: 'CALCULATE',
            onPressed: () {
              calculator calc = calculator(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    actualbmireultvalue: calc.calculateBMI(),
                    bmiresult: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
