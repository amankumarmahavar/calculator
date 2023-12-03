String displayExpression = '';

List<String> oprator = [];
List<String> operand = [];
int startIndex = 0;

bool isOperator(String e) {
  if (e == '+' || e == '-' || e == 'x' || e == '/' || e == '%' || e == '=') return true;
  return false;
}

bool isCut(String e) {
  if (e == '⌫ ') return true;
  return false;
}

bool isClear(String e) {
  if (e == 'AC') return true;
  return false;
}

bool isOperatorOperator(String e) {
  if (isOperator(e) &&
      isOperator(displayExpression[displayExpression.length - 1])) return true;
  return false;
}

whatOperation(String e) {
  if (isClear(e)) {
    displayExpression = '';
    startIndex = 0;
  }

  if (isCut(e)) {
    if (displayExpression != '') {
      displayExpression =
          displayExpression.substring(0, displayExpression.length - 1);
    }
  }

  if (e == '=') {
    for (int i = 0; i < displayExpression.length; i++) {
      if (isOperator(displayExpression[i])) {
        oprator.add(displayExpression[i]);
        operand.add(displayExpression.substring(startIndex, i));
        startIndex = i + 1;
      }
    }

    displayExpression = doCalculaion();
    startIndex = 0;
    oprator = [];
  }
  if (e == '%') {
    String temp = '';
    try {
      for (int i = displayExpression.length - 1;
          (!isOperator(displayExpression[i]));
          i--) {
        temp += displayExpression[i];
        displayExpression = displayExpression.substring(0, i);
      }
    } catch (e) {
      // print(Exception);
    }

    temp = (double.parse(temp.split('').reversed.join('')) / 100).toString();
    displayExpression += temp;
  }
}

String doCalculaion() {
  String op = '';
  String s1 = operand.removeAt(0);
  String s2 = '';

  while (operand.isNotEmpty) {
    op = oprator.removeAt(0);
    s2 = operand.removeAt(0);
    switch (op) {
      case '+':
        s1 = (double.parse(s1) + double.parse(s2)).toString();
        break;
      case '-':
        s1 = (double.parse(s1) - double.parse(s2)).toString();
        break;
      case 'x':
        s1 = (double.parse(s1) * double.parse(s2)).toString();
        break;
      case '/':
        s1 = (double.parse(s1) / double.parse(s2)).toString();
        break;
      default:
    }
  }
  return s1;
}
