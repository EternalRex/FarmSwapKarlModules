import "package:flutter/material.dart";

/*A TEXT WIDGET USED IN DASHBOARD OPTIONS */
class DashBoardTxt extends StatelessWidget {
  const DashBoardTxt({
    super.key,
    required this.myText,
    required this.myColor,
    required this.mySize,
    required this.myFont,
    required this.myWeight,
  });

  final String myText;
  final Color myColor;
  final double mySize;
  final String? myFont;
  final FontWeight myWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: TextStyle(
        color: myColor,
        fontSize: mySize,
        fontFamily: myFont,
        fontWeight: myWeight,
      ),
    );
  }
}

/*JUST A SEPARATE CLASS OF A TEXT WIDGET SO THAT I CAN USE THIS AS THE TITLE 
OF DASHBOARD AND USE SOME SHADOW PROPERTIES */
class DashBoardTitleText extends StatelessWidget {
  const DashBoardTitleText(
      {super.key,
      required this.myText,
      required this.myColor,
      required this.mySize,
      required this.myFont,
      required this.myWeight});

  final String myText;
  final Color myColor;
  final double mySize;
  final String? myFont;
  final FontWeight myWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: TextStyle(
        color: myColor,
        fontSize: mySize,
        fontFamily: myFont,
        fontWeight: myWeight,
        shadows: const [
          Shadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(6, 1),
          )
        ],
      ),
    );
  }
}
