import 'dart:ui';

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<CalculatorScreen> {
  final TextEditingController _outputController = TextEditingController();
  // final TextEditingController _totalController = TextEditingController();
  double? _firstNumber, _secondNumber;
  double? result;
  String operation = "";
  List<String> buttons = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];
  _value(String value) {
    if (value == "C") {
      setState(() {
        _outputController.text = "";
      });
    } else if (value == "*") {
      _firstNumber = double.parse(_outputController.text);
      _outputController.text = "";

      operation = value;
    } else if (value == "/") {
      _firstNumber = double.parse(_outputController.text);
      _outputController.text = "";
      operation = value;
    } else if (value == "<-") {
      List<String> value = _outputController.text.split("");
      if (value.isNotEmpty) {
        value.removeLast();
        _outputController.text = value.join();
      }
    } else if (value == "1") {
      _outputController.text += value;
    } else if (value == "2") {
      _outputController.text += value;
    } else if (value == "3") {
      _outputController.text += value;
    } else if (value == "+") {
      _firstNumber = double.parse(_outputController.text);
      _outputController.text = "";
      operation = value;
    } else if (value == "4") {
      _outputController.text += value;
    } else if (value == "5") {
      _outputController.text += value;
    } else if (value == "6") {
      _outputController.text += value;
    } else if (value == "-") {
      _firstNumber = double.parse(_outputController.text);
      _outputController.text = "";
      operation = value;
    } else if (value == "7") {
      _outputController.text += value;
    } else if (value == "8") {
      _outputController.text += value;
    } else if (value == "9") {
      _outputController.text += value;
    } else if (value == "%") {
      _firstNumber = double.parse(_outputController.text);
      _outputController.text = "";
      operation = value;
    } else if (value == "0") {
      _outputController.text += value;
    } else if (value == ".") {
      _outputController.text += value;
    } else if (value == "=") {
      _secondNumber = double.parse(_outputController.text);
      _outputController.text = "";
      _calculate(operation, _firstNumber!, _secondNumber!);
    }
  }

  Color _condition(value) {
    if (value == "C") {
      return Color.fromARGB(255, 255, 17, 0);
    } else if (value == "=") {
      return Color.fromARGB(255, 21, 255, 0);
    } else if (value == "<-") {
      return Color.fromARGB(221, 255, 0, 0);
    }
    return Color.fromARGB(255, 0, 0, 0);
  }

  _calculate(String operation, double firstNumber, double secondNumber) {
    _firstNumber = firstNumber;
    _secondNumber = secondNumber;
    switch (operation) {
      case "+":
        setState(() {
          result = _firstNumber! + _secondNumber!;
        });
        break;
      case "-":
        setState(() {
          result = _firstNumber! - _secondNumber!;
        });
        break;
      case "*":
        setState(() {
          result = _firstNumber! * _secondNumber!;
        });
        break;
      case "/":
        setState(() {
          result = _firstNumber! / _secondNumber!;
        });
        break;
      case "%":
        setState(() {
          result = firstNumber / secondNumber * 100;
        });
        break;
    }
    _outputController.text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 155, 132, 132),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _outputController,
                textAlign: TextAlign.end,
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                      
                    ),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 30,
                ),
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: [
                  for (int i = 0; i < buttons.length; i++) ...{
                    InkWell(
                      child: MaterialButton(
                        color: _condition(buttons[i]),
                        onPressed: () {
                          _value(buttons[i]);
                        },
                        child: Text(
                          buttons[i],
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  }
                ],
              ),
            )
          ],
        )
      );
  }
}
