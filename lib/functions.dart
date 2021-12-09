import 'package:flutter/material.dart';
import 'fuel_pump.dart';

double getWidth(BuildContext context) {
  final double width;
  width = MediaQuery.of(context).size.width;
  return width;
}

double getHeight(BuildContext context) {
  final double height;
  height = MediaQuery.of(context).padding.top;
  return height;
}

String ownReverse(var reverse){
  reverse.toString();
  var text = "";
  for(var i = reverse.length - 1;i >= 0; i--){
    text += reverse[i];
  }
  return text;
}

FuelPump setPrice(String type, double price, FuelPump pump) {
  switch (type) {
    case "1":
      pump.type = fuelType.standard;
      break;
    case "2":
      pump.type = fuelType.alcohol;
      break;
    case "3":
      pump.type = fuelType.premium;
      break;
    case "4":
      pump.type = fuelType.diesel;
      break;
  }
  pump.fuelPrice = price;
   return pump;
}



