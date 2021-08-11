import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Counter with ChangeNotifier {
  var userInput = '';
  var answer = '';

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();

    addhistory(userInput, answer);
  }

  List<String> _history = [
    '',
  ];
  List<String> get item => _history;
  void addhistory(String history, String answer) {
    _history.add('$history = $answer');
    notifyListeners();
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
