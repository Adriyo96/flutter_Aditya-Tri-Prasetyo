void main(){
  
  int width = 6;
  
    for(int i = 0 ; i < 2*width; i++) {
      var stars = '';
      
      for(int j = 0; j <= i && i < width; j++) {
         stars += ' ';
      }
      
      for(int j = (width-i); j > 0 && i < width; j--) {
         stars += '0 ';
      }
      
      for(int j = (2*width-i); j > 0 && i > width; j--) {
         stars += ' ';
      }
      
      for(int j = width; j <= i && i > width; j++) {
         stars += '0 ';
      }
      
      if (i != width) {
        print(stars);
      }
  }
}