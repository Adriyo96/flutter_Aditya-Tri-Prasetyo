import 'dart:async';

void main() async {
  int inputNumber = 5;
  int factorial = await calculateFactorial(inputNumber);
  print("Faktorial dari $inputNumber adalah $factorial");
}

Future<int> calculateFactorial(int number) async {
  if (number == 0 || number == 1) {
    return 1;
  }

  int result = 1;
  for (int i = 2; i <= number; i++) {
    result *= i;
  }

  return result;
}