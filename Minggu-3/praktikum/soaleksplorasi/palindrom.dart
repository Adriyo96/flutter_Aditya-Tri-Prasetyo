bool isPalindrome(String word) {
  String reversedWord = word.split('').reversed.join('');
  return word == reversedWord;
}

void main() {
  String inputWord = "mobil balap";

  if (isPalindrome(inputWord)) {
    print("$inputWord adalah sebuah palindrom.");
  } else {
    print("$inputWord bukan sebuah palindrom.");
  }
}