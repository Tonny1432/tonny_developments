import 'dart:math';

class calculator {
  calculator({required this.weight, required this.height});
  final int weight;
  final int height;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVER WEIGH';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDER WEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a  higher body weight than other, You can  do more execerise';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight , Great job';
    } else {
      return 'You have  a lower body weight than other,You can eat more';
    }
  }
}
