import 'dart:io';

class Question {
  String? text, correctAnswer;
  List<String> selections;

  Question(this.text, this.correctAnswer, this.selections);

  bool checkAnswer(String? userSelection) {
    return userSelection!.toLowerCase() == correctAnswer!.toLowerCase();
  }
}

class QuizGame {
  List<Question> questions = [];
  int? point = 0;
  int? correctAnswers = 0;

  void introduceGame() {
    print("Bu oyun içerisinde 4 şıktan oluşan soruları cevaplandıracaksınız.");
    print("Sırasıyla A-B-C-D Olarak İşlenmektedir.");
    print(
        "Verdiğiniz Her Cevap İçin 5 Puan Kazanırken, Her Yanlış Cevap İçin 3 Puan Kaybedeceksiniz.");
    print("Oyuna Başlamak İçin Enter'e Basınız.");
  }

  void startGame() {
    for (var question in questions) {
      print(question.text);
      question.selections.forEach((element) {
        print(element);
      });
      stdout.write("Seçiminiz: ");
      var userAnswer = stdin.readLineSync()!;
      if (question.checkAnswer(userAnswer)) {
        print("Doğru!");
        correctAnswer();
        print("Puanınız: ${getCurrentPoint()}\n");
      } else {
        print("Yanlış! Doğru Cevap: ${question.correctAnswer}\n");
        wrongAnswer();
      }
    }
  }

  void endGame() {
    print("Oyunu Tamamladınız!");
    print("Puanınız: ${point}");
    print("Doğru Cevap Sayısı: $correctAnswers");
    print("Yanlış Cevap Sayısı: ${20 - correctAnswers!}");
  }

  void addQuestion(Question question) {
    questions.add(question);
  }

  int? getCurrentPoint() {
    return point;
  }

  void correctAnswer() {
    point = point! + 5;
    correctAnswers = correctAnswers! + 1;
  }

  void wrongAnswer() {
    point = point! - 3;
  }
}

void loadQuestions(QuizGame game) {
  //Loads all of the questions.
  game.addQuestion(Question("Stardew Valley'in Geliştiricisi Kimdir?", "C",
      ["Thomas Happ", "Markus Persson", "Eric Barone", "Lucas Pope"]));
  game.addQuestion(Question(
      "Mount And Blade Serisinin Üreticisi Hangi Firmadır?",
      "A",
      ["Tale Worlds", "Activision", "Microsoft", "Deep Silver"]));
  game.addQuestion(Question(
      "League Of Legends Oyunu Piyasaya Sürülmeden Önce İnsanların Hayatları Nasıldı?",
      "D",
      ["İyi", "Çok İyi", "Harika", "Mükemmel"]));
  game.addQuestion(Question(
      "Metin 2'de İnsanları Deli Eden NPC'sinin Adı Nedir?",
      "C",
      ["Depocu", "Simyacı", "Demirci", "Seyis"]));
  game.addQuestion(Question(
      "Günümüzde Hızlı Tüketilebilir Oyunlardan Clicker Tarzı Oyunların Atası Kimdir?",
      "C", [
    "Clicker Heroes",
    "AdVenture Capitalis",
    "Cookie Clicker",
    "Tap Wizards"
  ]));

  game.addQuestion(Question(
      "Minecraft'ta Nethere Gitmek İçin Gerekli Olan Bloğun İsmi ve Miktarı?",
      "B", [
    "Obsidyen:8",
    "Obsidyen:10",
    "Ağlayan Obsidyen:8",
    "Ağlayan Obisdyen:10"
  ]));

  game.addQuestion(Question(
      "Fallout, Skyrim, Starfield Gibi Oyunlarla Tanınan Firma Hangisidir?",
      "B",
      ["Activision", "Bethesda", "From Software", "Paradox Interactive"]));
  game.addQuestion(Question(
      "Rockstar Games'in Geliştirmiş Olduğu Read Dead Redemption 2'deki Başrolümüzün Eski Sevgilisinin Adı Nedir?",
      "A",
      ["Mary Linton", "Abigail Marston", "Sadie Adler", "Susan Grimshaw"]));

  game.addQuestion(Question(
      "Beyond Two Souls, Detroit: Become Human Gibi Oyunlarıyla Gönlümüzde Taht Kuran Firmanın Adı Nedir?",
      "D", [
    "ZA/UM",
    "Dontnod Entertainment",
    "Supermassive Games",
    "Quantic Dream"
  ]));
  game.addQuestion(Question(
      "Şimdiye Kadar Gelmiş Geçmiş En Güzel Oyun?(Enis Kirazoğlu'na Göre)",
      "B",
      ["Division 2", "Witcher 3", "FIFA22", "RDR 2"]));
  game.addQuestion(Question(
      "Dead Space'deki Madenci Gemisinin İsmi Hangisidir?",
      "A",
      ["USG Ishimura", "USG Valor", "USM Abraxis", "USG Kellion"]));
  game.addQuestion(
      Question("Far Cry 3'te başrol Jason Brady'nin Amacı nedir?", "B", [
    "Kardeşini Kurtarmak",
    "Arkadaşlarını Kurtarmak",
    "Hazineyi Ele Geçirmek",
    "Adayı Ele Geçirmek"
  ]));
  game.addQuestion(Question(
      "Cyberpunk: 2077 Oyunundaki Karakterimizin Adı Nedir?",
      "B",
      ["Viktor", "V", "Johnny Silverhand", "Dex DeShawn"]));

  game.addQuestion(Question(
      "Starfield Oyununda Büyük Koloniler Savaşında Karşı Karşıya Gelen İki Birlik Hangisidir?",
      "D", [
    "Va'ruun Hanedanlığı - Birleşmiş Koloniler",
    "İnsanlar - Uzaylılar",
    "İnsanlar - Yıldızdoğanlar",
    "Birleşmiş Koloniler - Hüryıldız Kollektifi"
  ]));

  game.addQuestion(Question(
      "Aşağıdakilerden Hangisi Şehir Kurma Simulasyonudur?",
      "A",
      ["Cities Skylines", "A Plague Tail", "Control", "Elder Scrolls V"]));
  game.addQuestion(Question("Uncharted Serisinde Başrolün İsmi Nedir", "B",
      ["Victor Sullivan", "Nathan Drake", "Armando Moncada", "Chloe Frozer"]));
  game.addQuestion(Question(
      "DOOM Oyunu Aşağıdakilerden Hangisinde Çalıştırılamaz?",
      "D",
      ["Hamilelik Testi", "Hesap Makinesi", "Yazıcı", "Elektronik Sigara"]));

  game.addQuestion(Question("Cyberpunk Serisinin Animesinin Adı Nedir?", "D", [
    "Cyberpsychosis",
    "Tales Of DeShawn",
    "Johnny 'Samurai' Silverhand",
    "Edgerunners"
  ]));

  game.addQuestion(Question(
      "Captain Price Karakterini Bize Tanıtan Oyun Serisi Hangisidir?",
      "C",
      ["Medal Of Honor", "Battlefield", "Call of Duty", "Crysis"]));

  game.addQuestion(Question(
      "Dallas Karakteri Aşağıdaki Oyunlardan Hangisinde Bulunmaktadır?",
      "C",
      ["Rainbow Six", "Valorant", "Payday", "Call of Duty"]));
}

void main(List<String> args) {
  var game = QuizGame();
  loadQuestions(game);
  game.introduceGame();
  stdin.readLineSync();

  game.startGame();
  game.endGame();
}
