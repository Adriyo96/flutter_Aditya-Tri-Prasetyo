import 'dart:math';

void main() {
  Circle circle = Circle(14);
  print('Luas dan keliling lingkaran dengan jari-jari ${circle.radius} cm adalah :');
  print('Luas = ${circle.getArea()} cm^2');
  print('Keliling = ${circle.getPerimeter()} cm');
  print('');

  Square square = Square(6);
  print('Luas dan keliling persegi dengan sisi ${square.side} cm adalah :');
  print('Luas = ${square.getArea()} cm^2');
  print('Keliling = ${square.getPerimeter()} cm');
  print('');

  Rectangle rectangle = Rectangle(4, 5);
  print('Luas dan keliling persegi panjang dengan lebar ${rectangle.width} cm dan tinggi ${rectangle.height} cm adalah :');
  print('Luas = ${rectangle.getArea()} cm^2');
  print('Keliling = ${rectangle.getPerimeter()} cm');
  print('');
}

abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape {
  int? radius;

  Circle(this.radius);

  @override
  getArea() {
    return (pi*pow(radius!, 2)).round();
  }

  @override
  getPerimeter() {
    return (2*pi*radius!).round();
  }
}

class Square implements Shape {
  int? side;

  Square(this.side);

  @override
  getArea() {
    return (pow(side!, 2)).toInt();
  }

  @override
  getPerimeter() {
    return 4*side!;
  }
}

class Rectangle implements Shape {
  int? width;
  int? height;

  Rectangle(this.width, this.height);

  @override
  getArea() {
    return width!*height!;
  }

  @override
  getPerimeter() {
    return (2*width!)+(2*height!);
  }
}