import 'dart:math';

class Brain {
  Brain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0;

  String calculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi <= 18.5) {
      return 'UNDERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.Try to exercise more.';
    } else if (_bmi <= 18.5) {
      return 'You have a lower than normal body weight.Try to improve your nutrition.';
    } else {
      return 'You have a normal body weight. Good job!';
    }
  }
}
