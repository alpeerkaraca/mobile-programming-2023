import 'dart:math';

generateRandom() {
  var test = Random().nextBool() ? 100 : null;
  return test;
}

void main(List<String> args) {
  var status = generateRandom();
  // ? 100
  // : 0; // ?? -> Null Aware -> https://www.geeksforgeeks.org/dart-null-aware-operators/
  print(status);
}
