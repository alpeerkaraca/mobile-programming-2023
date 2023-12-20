class Camera {
  int? _id, _price;
  String? _brand, _color;

  Camera(this._id, this._price, this._brand, this._color);

  props() {
    return "ID: ${this._id}\nBrand: ${this._brand}\nPrice: ${this._price}\nColor: ${this._color}";
  }

  // Getters
  getId() {
    return this._id;
  }

  getPrice() {
    return this._price;
  }

  getBrand() {
    return this._brand;
  }

  getColor() {
    return this._color;
  }

  // Setters
  setId(int? id) {
    this._id = id;
  }

  setPrice(int? price) {
    this._price = price;
  }

  setBrand(String? brand) {
    this._brand = brand;
  }

  setColor(String? color) {
    this._color = color;
  }
}

void main(List<String> args) {
  var canon = Camera(0, 11750, "Canon", "Black");
  var sony = Camera(1, 22299, "Sony", "Black");
  var nikon = Camera(2, 29710, "Nikon", "Black");

  print("Before: Canon's Color -> ${canon.getColor()}");
  canon.setColor("Gray");
  print("After: Canon's Color -> ${canon.getColor()}\n");

  print(canon.props());
  print(sony.props());
  print(nikon.props());
}
