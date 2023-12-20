class House {
  int? id, price;
  String? name;

  House(this.id, this.price, this.name);

  String properties() {
    return "ID: ${this.id}\nName: ${this.name}\nPrice: ${this.price}\n";
  }
}

void main(List<String> args) {
  House apartment = House(1, 2350000, "2 + 1 Daire");
  House detached = House(2, 4500000, "2 + 1 Müstakil");
  House waterside = House(3, 18000000, "Yalı Ev ");

  List<House> houseList = <House>[apartment, detached, waterside];

  houseList.forEach((element) {
    print(element.properties());
  });
}
