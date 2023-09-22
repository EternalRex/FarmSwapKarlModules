import "package:flutter/material.dart";

//DECLARING THE CONSTANT SCREEN SIZES
const int laptopLargeScreen = 1500;
const int laptopMediumScreen = 1400;
const int laptopSmallScreen = 1300;

//CREATING THE RESPONSIVE SCREEN CLASS
class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({
    super.key,
    required this.largeScreen,
    required this.smallScreen,
    required this.mediumScreen,
  });

  //DECLARING LOCAL FIELDS/VARIABLES THAT WILL HOLD THE SCREEN SIZES
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  //METHOD THAT WILL GET THE FIFTEEN INCH SCREENSIZE AND BIGGER
  static bool isLaptopLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= laptopLargeScreen;

  //METHOD FOR FOURTEEN INCH SCREEN SIZE
  static bool isLaptopMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < laptopLargeScreen &&
      MediaQuery.of(context).size.width >= laptopMediumScreen;

  //METGID FIR THERTEEN INCH SCREEN SIZE
  static bool isLaptopSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < laptopMediumScreen &&
      MediaQuery.of(context).size.width >= laptopSmallScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //ASSIGNING THE INTEGER VALUE OF THE MAXIMUM SCREEN WIDTH TO A VARIBALE WIDTH
        double width = constraints.maxWidth;
        //IF SCREEN WIDTH IS GREATER THAN OR EQUAL TO 15INCHES THEN RETURN LARGE SCREEN
        if (width >= laptopLargeScreen) {
          return largeScreen;
        }
        //IF SCREEN WIDTH IS LESS THAN 15 INCHES BUT EQUAL OR GREATER THAN 14 INCHES
        else if (width < laptopLargeScreen && width >= laptopMediumScreen) {
          return mediumScreen;
        }
        //IF IT IS BELOW 14 INCHES RETURN THIS SMALL SCREEN
        else {
          return smallScreen;
        }
      },
    );
  }
}
