void main(){
  
  int width = 10;
  
    for(int i = 0 ; i < width; i++) {
      var stars = '';
      
      for(int j = (width-i); j > 1; j--) {
        stars += ' ';
      }
      
      for(int j = 0; j <= i; j++) {
        stars += '* ';
      }
      
      print(stars);
  }
}