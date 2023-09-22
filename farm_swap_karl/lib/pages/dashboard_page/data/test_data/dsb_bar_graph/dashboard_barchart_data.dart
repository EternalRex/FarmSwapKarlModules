import "package:flutter/material.dart";
import 'package:collection/collection.dart';

class BarterGraphData {
  BarterGraphData({required this.x, required this.y});

  final int x;
  final double y;

  List<BarterGraphData> get barterTransacData {
    final barterTransac = <double>[
      200,
      100,
      400,
      500,
      150,
    ];
    return barterTransac
        .mapIndexed(
          (index, element) => BarterGraphData(x: index, y: element),
        )
        .toList();
  }
}
