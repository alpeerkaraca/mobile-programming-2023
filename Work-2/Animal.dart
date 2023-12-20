//

class Animal {
  int? id;
  String? color, name;

  Animal(this.id, this.name, this.color);
}

class Cat extends Animal {
  String? sound;

  Cat(int id, String name, String color, this.sound) : super(id, name, color);
}

void main(List<String> args) {
  Cat cat = Cat(0, "Kedi", "Turuncu", "Meoww!");

  print(
      "Details:\nID: ${cat.id}\nName:${cat.name}\nColor: ${cat.color}\nSound: ${cat.sound}");
}
