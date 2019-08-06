import 'dart:math';

///  Calculator Model
///  Calculates The BMI By Specifying The Height [_height] In cm And The
///  Weight [_weight] In Kg's
///
///
class CalculatorModel {
  final int _height;
  final int _weight;
  double _BMI = 0.0;

  CalculatorModel(this._height, this._weight) {
    _BMI = _weight / pow(_height / 100, 2);
  }

  String getBMI() {
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI >= 25) {
      return "Overweight";
    } else if (_BMI > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return "You have a higher than normal body weight, #Fitness";
    } else if (_BMI > 18.5) {
      return "You have a normal body weight, #Baddie";
    } else {
      return "You have a lower than normal body weight, #Indulge";
    }
  }
}
