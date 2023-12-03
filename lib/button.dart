import 'package:flutter/material.dart';
import 'calc_brain.dart';


// (isClear()||isOperator()||isCut())
class Keypad extends StatelessWidget {
  dynamic e;
  void Function() onTap;
  Keypad({required this.e, required this.onTap});

  late Color keyColor;
  late double fontSize;
  void keyFontInitializer() {
    if (isClear(e) || isCut(e) || e == '=' || isOperator(e)) {
      fontSize = 35;
      keyColor = const Color.fromARGB(255, 177, 147, 41);
    } else {
      keyColor = Colors.white60;
      fontSize = 30;
    }
  }

  @override
  Widget build(BuildContext context) {
    keyFontInitializer();
    return TextButton(
      onPressed: onTap,
      child: Container(
        child: Center(
          child: Text(
            '$e',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: keyColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
