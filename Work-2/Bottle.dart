abstract class Bottle {
  Open();
}

class CokeBottle implements Bottle {
  @override
  Open() {
    return "Coke Bottle is Opened";
  }
}

class BottleFactory {
  createBottle(String? typeOfBottle) {
    if (typeOfBottle == "Coke") {
      return CokeBottle();
    }
  }
}

void main(List<String> args) {
  var cokeBottle = BottleFactory().createBottle("Coke");

  print(cokeBottle.Open());
}
