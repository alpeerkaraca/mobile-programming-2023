import "dart:io";

// 4 İşlem ve İşlem Sonlandırma Fonksiyonları
double summary(double number, double otherNumber) => number + otherNumber;
double difference(double number, double otherNumber) => number - otherNumber;
double multiply(double number, double otherNumber) => number * otherNumber;
double divide(double number, double otherNumber) => number / otherNumber;
void terminateCalculator() {
  print(
      "Hesap Makinemizi Kullandığınız İçin Teşekkürler. Tekrar Görüşmek Üzere 😊");
  exit(0);
}

//Hesap Makinesi Fonksiyonu
void calculatorStart() {
  print("Aşağıdaki Menüden Seçiminizi Belirtiniz:");
  print("1)Toplama(+) \t\t3)Çarpma(x)");
  print("2)Çıkarma(-) \t\t4)Bölme(/)");
  print("Uygulamayı Kapatmak İçin Q Yazabilirsiniz.");

  stdout.write("Seçiminiz: ");
  String? selection = stdin.readLineSync()!;

  //Kullanıcı girdisini her durumda almak yerine dışarıda bir kere almak daha iyi olabilir
  //Ancak bu durumda da yanlış ifade girmesi durumunda bile değer alıp kullanıcıyı bekletiyordu.
  switch (selection) {
    case "1":
      stdout.write("1.Sayıyı Giriniz: ");
      double number = double.parse(stdin.readLineSync()!);

      stdout.write("2.Sayıyı Giriniz: ");
      double otherNumber = double.parse(stdin.readLineSync()!);
      print("Sonuç: ${summary(number, otherNumber)}");
      break;

    case "2":
      stdout.write("1.Sayıyı Giriniz: ");
      double number = double.parse(stdin.readLineSync()!);

      stdout.write("2.Sayıyı Giriniz: ");
      double otherNumber = double.parse(stdin.readLineSync()!);
      print("Sonuç: ${difference(number, otherNumber)}");

      break;
    case "3":
      stdout.write("1.Sayıyı Giriniz: ");
      double number = double.parse(stdin.readLineSync()!);

      stdout.write("2.Sayıyı Giriniz: ");
      double otherNumber = double.parse(stdin.readLineSync()!);
      print("Sonuç: ${multiply(number, otherNumber)}");
      break;

    case "4":
      stdout.write("1.Sayıyı Giriniz: ");
      double number = double.parse(stdin.readLineSync()!);

      stdout.write("2.Sayıyı Giriniz: ");
      double otherNumber = double.parse(stdin.readLineSync()!);
      otherNumber == 0
          ? print("Bölen 0 Olamaz.")
          : print("Sonuç: ${divide(number, otherNumber)}");
      break;

    case "Q" || "q":
      terminateCalculator();
    default:
      print(
          "Seçeneklerde Belirli Olmayan Bir İşlem Saptandı.\nLütfen Yeniden Seçim Yapınız");
  }
  print("");
}

//Dart dilinde biçimlendirme kurallarına pek hakim olmadığım için main fonksiyonunu başta mı yoksa sonda mı göstermem daha iyidir bilemedim.
void main() {
  print(
      "---------------------------------------------\n|Dört İşlemli Hesap Makinesine Hoş Geldiniz!|\n---------------------------------------------");
  while (true) {
    calculatorStart();
  }
}
