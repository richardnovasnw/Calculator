import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Counter with ChangeNotifier {
  String userInput = '';
  String answer = '';
  void modify(int index) {
    userInput += buttons[index];
    notifyListeners();
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    final Parser p = Parser();
    final Expression exp = p.parse(finaluserinput);
    final ContextModel cm = ContextModel();
    final double eval = exp.evaluate(EvaluationType.REAL, cm) as double;
    answer = eval.toString();

    addhistory(userInput, answer);
  }

  final List<String> _history = <String>[
    '',
  ];
  List<String> get item => _history;
  void addhistory(String history, String answer) {
    _history.add('$history = $answer');
    notifyListeners();
  }

  void clear() {
    userInput = '';
    answer = '0';
    notifyListeners();
  }

  void equal() {
    equalPressed();
    notifyListeners();
  }

 

  void delete() {
    userInput = userInput.substring(0, userInput.length - 1);
    notifyListeners();
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
}
