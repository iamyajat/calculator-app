import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Random random = new Random();
  var sign = "+";
  var num1 = 0;
  var num2 = 0;
  var answer = 0.0;

  TextEditingController n1 = new TextEditingController(text: "");
  TextEditingController n2 = new TextEditingController(text: "");

  _CalculatorPageState() {
    num1 = random.nextInt(100);
    num2 = random.nextInt(100);
    n1 = new TextEditingController(text: "$num1");
    n2 = new TextEditingController(text: "$num2");
    answer = double.parse("${num1 + num2}");
  }

  void _add() {
    setState(() {
      sign = "+";
    });
  }

  void _subtract() {
    setState(() {
      sign = "−";
    });
  }

  void _multiply() {
    setState(() {
      sign = "×";
    });
  }

  void _divide() {
    setState(() {
      sign = "÷";
    });
  }

  void _calculate() {
    setState(() {
      num1 = int.parse(n1.text);
      num2 = int.parse(n2.text);
      if (sign == "+") {
        answer = double.parse("${num1 + num2}");
      } else if (sign == "−") {
        answer = double.parse("${num1 - num2}");
      } else if (sign == "×") {
        answer = double.parse("${num1 * num2}");
      } else if (sign == "÷") {
        answer = double.parse("${num1 / num2}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Center(
          child: Text(
            widget.title.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.9),
                        width: 1,
                      ),
                    ),
                    color: Colors.transparent,
                    elevation: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "$answer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4.0, 0, 10.0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: '0'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                        ),
                        controller: n1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$sign",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 4.0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: '0'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                        ),
                        controller: n2,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 2.0, 10.0),
                      child: MaterialButton(
                        child: Text(
                          "+",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.red,
                        onPressed: _add,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                      child: MaterialButton(
                        child: Text(
                          "−",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.red,
                        onPressed: _subtract,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                      child: MaterialButton(
                        child: Text(
                          "×",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.red,
                        onPressed: _multiply,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 10.0, 0, 10.0),
                      child: MaterialButton(
                        child: Text(
                          "÷",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.red,
                        onPressed: _divide,
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                child: Text(
                  "=",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.red,
                onPressed: _calculate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
