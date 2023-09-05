import "package:flutter/material.dart";
import 'package:collection/collection.dart';

class PricePoint2 {
  PricePoint2({required this.x, required this.y});
  //CONTAINS  2 VARIABLES, X FOR THE INDEX AND Y FOR THE PRICE VALUE

  final int x; //REPRSENTS THE X AXIS
  final double y; //REPRESENTS THE Y AXIS
}

//METHOD THAT RETURNS THE LIST OF PRICE POINT OBJECTS
List<PricePoint2> get pricePoints2 {
  //CRREATING EACH PRICE POINT OBJECT BY JUST USING STATIC DATA
  //IN ACTUAL WE CAN USE THE STREAM API FROM FIREBASE
  final data = <double>[
    500,
    6000,
    0,
    1000,
    2500,
    1500,
    2000,
    3000,
    4000,
    3500,
    4500,
    7000,
  ];
  return data
      .mapIndexed(
        (index, element) => PricePoint2(x: index, y: element),
      )
      .toList();
}
