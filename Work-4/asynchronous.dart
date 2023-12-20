import 'dart:io';

void main(List<String> args) async {
  List<int> list = <int>[];

  stdout.write("Listenin içereceği eleman sayısı: ");
  var limit = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < limit; i++) {
    stdout.write("${i + 1}. Sayıyı Giriniz:");
    list.add(int.parse(stdin.readLineSync()!));
  }

  List<int> modifiedList = await multiplyListByTwo(list);

  print(modifiedList);
}

Future<List<int>> multiplyListByTwo(List<int> list) async {
  List<int> modifiedList = <int>[];

  for (var element in list) {
    int res = await element * 2;

    modifiedList.add(res);
  }

  return modifiedList;
}
