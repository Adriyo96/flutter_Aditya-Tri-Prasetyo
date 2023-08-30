void main() {
  var elements = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust"];
  var map = Map();

  elements.forEach((element) {
    if(!map.containsKey(element)) {
      map[element] = 1;
    } else {
      map[element] += 1;
    }
  });

  print(map);
}