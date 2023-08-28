void main() {
  int bilangan = 12;

  bool isPrime = true;

  if (bilangan <= 1) {
    isPrime = false;
  } else {
    for (int i = 2; i <= bilangan / 2; i++) {
      if (bilangan % i == 0) {
        isPrime = false;
        break;
      }
    }
  }

  if (isPrime) {
    print("$bilangan adalah bilangan prima.");
  } else {
    print("$bilangan bukan bilangan prima.");
  }
}