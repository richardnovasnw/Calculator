import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  var userInput = '';
  var answer = '';

  List<String> _history = [
    '',
  ];
  List<String> get item => _history;
  void addhistory(String history, String answer) {
    _history.add('$history = $answer');
    notifyListeners();
  }
}
