import "package:flutter/material.dart";
import 'package:collection/collection.dart';

class PricePoint3 {
  PricePoint3({required this.x, required this.y});
  //CONTAINS  2 VARIABLES, X FOR THE INDEX AND Y FOR THE PRICE VALUE

  final int x; //REPRSENTS THE X AXIS
  final double y; //REPRESENTS THE Y AXIS
}

//METHOD THAT RETURNS THE LIST OF PRICE POINT OBJECTS
List<PricePoint3> get pricePoints3 {
  //CRREATING EACH PRICE POINT OBJECT BY JUST USING STATIC DATA
  //IN ACTUAL WE CAN USE THE STREAM API FROM FIREBASE
  final data = <double>[
    1000,
    500,
    2000,
    3500,
    4000,
    3000,
    4500,
    1500,
    2500,
    7000,
    6000,
    0,
  ];
  return data
      .mapIndexed(
        (index, element) => PricePoint3(x: index, y: element),
      )
      .toList();
}
