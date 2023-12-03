import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'calc_brain.dart' as calc;

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late final List<Widget> _keypade = [
    'AC',
    '⌫ ',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '',
    '0',
    '.',
    '='
  ].map((e) {
    return Keypad(
      e: e,
      onTap: () {
        setState(() {
          if (!(calc.isCut(e) ||
              calc.isClear(e) ||
              e == '%' ||
              calc.isOperatorOperator(e))) calc.displayExpression += e;
        });
        calc.whatOperation(e);
      },
    );
  }).toList();

  @override
  Widget build(BuildContext contexpressionext) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black12,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0, right: 30.0),
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: Text(
                        calc.displayExpression,
                        style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white60,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.3,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 4,
                        childAspectRatio: 1.3,
                        children: _keypade),
                  )
                ],
              ),
            )));
  }
}
