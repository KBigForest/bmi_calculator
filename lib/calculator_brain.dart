import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int weight;
  final int height;
  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi?.toStringAsFixed(1) ?? 'Error'; //소수점 한자리 반환
  }

  String getResult() {
    if (_bmi == null) return 'Error';

    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }


  String getInterpretation() {
    if (_bmi == null) return 'Error';

    if (_bmi! >= 25) {
      return '몸무게가 꽤 나가시는 편인걸요? 조금 빼는 건 어떨까요?';
    } else if (_bmi! > 18.5) {
      return '정상체중이시네요! 이대로 유지하세요!';
    } else {
      return '저체중이시네요! 운동과 식단을 통해 근육과 몸무게를 증가시키세요!';
    }
  }

}
