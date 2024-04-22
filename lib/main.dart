

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _output = "0";
  String _outputHistory = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      setState(() {
        _output = "0";
        _outputHistory = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      });
      return;
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      _operand = buttonText;
      _num1 = double.parse(_output);
      _outputHistory = _output + _operand;
      _output = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == "×") {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == "÷") {
        _output = (_num1 / _num2).toString();
      }
      _outputHistory = "";
      _operand = "";
      _num1 = 0;
      _num2 = 0;
    } else {
      if (buttonText == "." && _output.contains(".")) {
        return;
      }
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {
      _output = _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _outputHistory,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    _output,
                    style: TextStyle(fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: Colors.black),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("÷"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("×"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("."),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
