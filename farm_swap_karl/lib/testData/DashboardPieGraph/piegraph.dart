import "package:farm_swap_karl/colors/colors.dart";
import "package:flutter/material.dart";

/*A DATA CLASS THAT WILL CONTAIN THE DATA OF THE PIE */
class Data {
  /*A CONSTRUCTO TO INITIALIZE THE VARIABLES BELOW */
  Data({required this.name, required this.percent, required this.color});

/*THE VARIABLES THAT WILL HOLD THE PIIE GRAPH DATA SUCH AS NAME, PERCENT AND COLOR */
  final String name;
  final double percent;
  final Color color;
}

/*CREATING ANOTHER CLASS THAT WILL PUT THE GROUP OF DATA INTO A LIST */
class PieDataContent {
  /*INITIALIZING A DATA VARIABLE OF TYPE LIST, THIS <DATA> IS THE CLASS ABOVE */
  static List<Data> data = [
    Data(name: "Old Users", percent: 60, color: farmSwapTitlegreen),
    Data(name: "New Users", percent: 40, color: farmSwapSmoothGreen),
  ];
}
