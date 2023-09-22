import "package:flutter/material.dart";
import 'package:collection/collection.dart';

class PricePoint {
  PricePoint({required this.x, required this.y});
  //CONTAINS  2 VARIABLES, X FOR THE INDEX AND Y FOR THE PRICE VALUE

  final int x; //REPRSENTS THE X AXIS
  final double y; //REPRESENTS THE Y AXIS
}

//METHOD THAT RETURNS THE LIST OF PRICE POINT OBJECTS
List<PricePoint> get pricePoints {
  //CRREATING EACH PRICE POINT OBJECT BY JUST USING STATIC DATA
  //IN ACTUAL WE CAN USE THE STREAM API FROM FIREBASE
  final data = <double>[
    0,
    500,
    1000,
    2500,
    1500,
    2000,
    3000,
    3500,
    4000,
    6000,
    4500,
    7000,
  ];
  return data
      .mapIndexed(
        (index, element) => PricePoint(x: index, y: element),
      )
      .toList();
}
