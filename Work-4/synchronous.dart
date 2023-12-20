import 'dart:io';

void main(List<String> args) {
  stdout.write("1.Sayı: ");
  int num = int.parse(stdin.readLineSync()!);
  stdout.write("2.Sayı: ");
  int otherNum = int.parse(stdin.readLineSync()!);

  sum(num, otherNum);
}

Future<void> sum(int num, int otherNum) {
  return Future.delayed(
      Duration(seconds: 3), () => print("Sonuç: ${otherNum + num}"));
}
