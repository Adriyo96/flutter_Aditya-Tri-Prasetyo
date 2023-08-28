void main() {
  
  int limit = 9;
  
  for (int i = 1; i <= limit; i++) {
    String result = "";
    result += "$i";
    
    if (i > 9) {
      result += "  ";
    } else {
      result += "   ";
    }
    
    for (int j = 2; j <= limit; j++) {
      result += "${i*j}";
      
      if (i*j > 9) {
        result += "  ";
      } else {
        result += "   ";
      }
    }
    
    print(result);
  }
}