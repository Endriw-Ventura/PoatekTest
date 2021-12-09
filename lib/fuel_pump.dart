class FuelPump {
  fuelType type = fuelType.standard;
  double fuelPrice;
  double fuelQuantity;
  int number = 1;
  FuelPump({required this.type, required this.fuelPrice, required this.fuelQuantity, required this.number});



  double get _fuelQuantity {
    return fuelQuantity;
  }

  set _fuelQuantity(double value) {
    _fuelQuantity = value;
  }

  fuelType get _type => type;

  set _type(fuelType type) {
    _type = type;
  }

  double get _fuelPrice => fuelPrice;

  set _fuelPrice(double value) {
    fuelPrice = value;
  }

  String fillWithPrice(double price) {
    double liters = 0;
    bool enough = false;
    liters = price / fuelPrice;
    if (fuelQuantity > 0 && liters <= fuelQuantity) {
      enough = true;
    }
    if (price == 0 || !enough) {
      return 0.toString();
    } else {
      return liters.toStringAsFixed(2);
    }
  }

  String fillWithLiters(double liters) {
    double price = 0;
    bool enough = false;
    price = fuelPrice * liters;
    if (fuelQuantity > 0 && liters <= fuelQuantity) {
      enough = true;
    }
    if (liters == 0 || !enough) {
      return 0.toString();
    } else {
      return price.toStringAsFixed(2);
    }
  }
}

enum fuelType {
  standard, //1
  alcohol, //2
  premium, //3
  diesel //4
}