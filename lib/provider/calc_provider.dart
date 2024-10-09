import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier{
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  String get output => _output;

  void input(String buttonText){
    if (buttonText == "C"){
      _clear();
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/" || buttonText == "%"){
      _operator = buttonText;
      _num1 = double.tryParse(_input) ?? 0;
      _input = "";
    } else if (buttonText == "="){
      _num2 = double.tryParse(_input) ?? 0;
      _calculate();
    } else {
      _input += buttonText;
    }
    _output = _input.isEmpty ? "0" : _input;
    notifyListeners();
  }

  void _clear(){
    _output = "0";
    _input = "";
    _num1 = 0;
    _num2 = 0;
    _operator = "";
    notifyListeners();
  }

  void _calculate() {
    double result = 0;
    switch (_operator) {
      case "+":
        result = _num1 + _num2;
        break;
      case "-":
        result = _num1 - _num2;
        break;
      case "*":
        result = _num1 * _num2;
        break;
      case "/":
        result = _num1 / _num2;
        break;
      case "%":
        result = _num1 % _num2;
        break;
    }
    _output = result.toString();
    _input = _output;
  }
}