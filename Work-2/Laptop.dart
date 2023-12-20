//Write a dart program to create a class Laptop with properties [id, name, ram] and create 3 objects of it and print all details.

class Laptop {
  int? id, ram;
  String? name;

  String? properties() {
    return "ID: ${this.id}\nName: ${this.name}\nRam: ${this.ram}";
  }
}

void main(List<String> args) {
  Laptop asus = Laptop();
  asus.id = 1;
  asus.name = "TUF";
  asus.ram = 16;

  print(asus.properties());
}
