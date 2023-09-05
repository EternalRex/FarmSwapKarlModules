import 'package:farm_swap_karl/testData/DashboardLineGraph/pricePoint.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../testData/DashboardLineGraph/pricePoint2.dart';
import '../../../testData/DashboardLineGraph/pricePoint3.dart';

class DashboardLineChart extends StatelessWidget {
  const DashboardLineChart(
      {super.key,
      required this.points,
      required this.points2,
      required this.points3});

  final List<PricePoint> points;
  final List<PricePoint2> points2;
  final List<PricePoint3> points3;

  @override
  Widget build(BuildContext context) {
    //RETURNS A LINE CHART WIDGET
    return LineChart(
      swapAnimationDuration: const Duration(milliseconds: 250),
      /*SAMPLEDATA1 IS A METHOD THAT GETS THE VALUES THAT WE PUT INTO OUR 
      CHART, NOT JUST THE VALUES, BUT ALSO THE BORDERS, THE GRIDDATA, THE LABELS
      AND TITLES */
      sampleData1,
    );
  }

/*THE METHOD THAT WILL GET EVERY VALUE*/
  LineChartData get sampleData1 => LineChartData(
        /*WE WILL CREATE A METHOD NAMED BORDERS DATA, IT WILL RETURN HOW THE BORDER
    OF OUR LINE CHART SHOULD BE LIKE */
        borderData: bordersData,
        /*WE WILL CREATE A METHOD NAMED GRIDSDATA, IT WILL RETURN HOW THE GRID LINES
    OF OUR CHART LOOKS LIKE */
        gridData: gridsData,
        /*WE WILL CREATE A METHOD NAMED TITLESDATA, IT WILL RETURN VALUES THAT WILL BE
    USED AS LABELS IN THE X AND Y AXIS OF OUR LINE CHART */
        titlesData: titlesData,
        /*WE WILL CREATE A METHOD NAMED LINEBARS DATA IT WILL RETURN THE DATA THAT WE
    HAVE DECLARED OR WHERE THE LINES OF OUR GRAPHS ARE BASED. THIS IS THE DATA BEING READ
    FROM THE FIREBASE DATABASE */
        lineBarsData: lineBarsData,
      );

/*THE GETTER METHOD THAT WILL RETURN THE DATAS TO BE PUT INSIDE THE LINECHARTDATA */
  List<LineChartBarData> get lineBarsData => [
        lineChartData1,
        lineChartData2,
        lineChartData3,
      ];

/*GETTING THE VALUES FROM THE PRICEPOINT CLASS */
  LineChartBarData get lineChartData1 => LineChartBarData(
        /*MAPS THE VALUE GATHERED FROM THE X AND Y VARIABLE OF THE PRICEPOINT
    CLASS INTO EVERY POINTS OF THE GRAPH */
        spots: points
            .map(
              (point) => FlSpot(
                point.x.toDouble(),
                point.y.toDouble(),
              ),
            )
            .toList(),
        isCurved: true,
        color: Colors.blue,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
      );

/*GETTING THE VALUES FROM THE PRICEPOINT2 CLASS */
  LineChartBarData get lineChartData2 => LineChartBarData(
        /*MAPS THE VALUE GATHERED FROM THE X AND Y VARIABLE OF THE PRICEPOINT
    CLASS INTO EVERY POINTS OF THE GRAPH */
        spots: points2
            .map(
              (point) => FlSpot(
                point.x.toDouble(),
                point.y.toDouble(),
              ),
            )
            .toList(),
        isCurved: true,
        color: Colors.purple,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
      );

  LineChartBarData get lineChartData3 => LineChartBarData(
        /*MAPS THE VALUE GATHERED FROM THE X AND Y VARIABLE OF THE PRICEPOINT
    CLASS INTO EVERY POINTS OF THE GRAPH */
        spots: points3
            .map(
              (point) => FlSpot(
                point.x.toDouble(),
                point.y.toDouble(),
              ),
            )
            .toList(),
        isCurved: true,
        color: Colors.green,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
      );
}

/*METHOD THAT WILL RETURN HOW THE BORDERS OF THE LINE GRAPH SHOULD LOOK LIKE */
FlBorderData get bordersData => FlBorderData(
      border: const Border(
        top: BorderSide(color: Colors.transparent),
        left: BorderSide(color: Colors.black),
        bottom: BorderSide(color: Colors.black),
      ),
    );

FlGridData get gridsData => FlGridData(
      show: false,
    );

/*A METHOD THAT WILL RETURN THE TITLE VALUES OF ALL THE SIDES OF THE LINE CHART TO THE
SAMPLEDATA1 METHOD */
FlTitlesData get titlesData => FlTitlesData(
      /*SINCE WE ARE GOING TO PUT CUSTOMIZE LABELS IN THE BOTTOM WE WILL CREATE
      A SEPRATE METHOD THAT WILL RETURN A SIDETITLES WIDGET BECAUSE BOTTOMTITLES IS 
      ASSIGNED TO A SIDETITLE PROPERTY */
      bottomTitles: AxisTitles(sideTitles: bottomTitles),
      /*SINCE WE ARE GOING TO PUT CUSTOMIZE LABELS IN THE LEFT SIDE WE WILL CREATE A
      SEPARATE METHOD THAT WILL RETURN A SIDETITLE WIDGET SIMILAR TO BOTTOMTITLES */
      leftTitles: AxisTitles(sideTitles: lefTitles),
      /*WE ARE NOT GOING TO PUT ANY LABLELS IN TOP SIDE */
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      /*WE ARE NOT GOING TO PUT ANY LABELS IN RIGHT SIDE */
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

SideTitles get bottomTitles => SideTitles(
      getTitlesWidget: bottomTitlesWidget,
      interval: 1,
      reservedSize: 30,
      showTitles: true,
    );

/*CREATING THE BOTTOM LABELS WIDGET WHOSE VALUE IS RETURNED ON THE
BOTTOMTITLE'S GETTITLEWIDGET PROPERTY,  */

/*TAKES 2 PARAMETERS, A VALUE WHICH REFERS TO THE INDEX OF VALUES
IN THE Y AXIS, SAY THE VALUES IN Y IS 1,2,3,4 THEN THE VALUE OF INDEX
IS 0, 1, 2, 3, THE META VARIABLE WILL HOLD META DATA OF THE LABELS
SUCH AS STYLES, TEXT, AND POSITION */
Widget bottomTitlesWidget(double value, TitleMeta meta) {
  /*CREATING A DEFAULT TEXT STYLE TO BE USED IN THE SWITCH STATEMENT */
  var style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.poppins().fontFamily,
    color: Colors.black45,
  );
  /*CREATING A WIDGET VARIABLE TO BE RETURNED SINCE THE FUNCTION
  NEEDS A WIDGET */
  Widget text;
  /*SWITCHING THE VALUES OF THE INDEX, BUT IT MUST BE FIRST CONVERTED
  INTO AN INTEGER */
  switch (value.toInt()) {
    case 0:
      text = Text(
        "Jan",
        style: style,
      );
      break;

    case 1:
      text = Text(
        "Feb",
        style: style,
      );
      break;

    case 2:
      text = Text(
        "Mar",
        style: style,
      );
      break;

    case 3:
      text = Text(
        "Apr",
        style: style,
      );
      break;

    case 4:
      text = Text(
        "May",
        style: style,
      );
      break;

    case 5:
      text = Text(
        "Jun",
        style: style,
      );
      break;

    case 6:
      text = Text(
        "July",
        style: style,
      );
      break;

    case 7:
      text = Text(
        "Aug",
        style: style,
      );
      break;

    case 8:
      text = Text(
        "Sep",
        style: style,
      );
      break;

    case 9:
      text = Text(
        "Oct",
        style: style,
      );
      break;

    case 10:
      text = Text(
        "Nov",
        style: style,
      );
      break;

    case 11:
      text = Text(
        "Dec",
        style: style,
      );
      break;

    default:
      text = const Text("");
      break;
  }
  /*RETURNING A SIDETITLE WIDGET CONTAINING THE LOCATION WHERE
  THE TITLE IS TO BE PUT, THE SPACE BETWEEN TITLES AND THE 
  RESULTING TEXT BASED ON THE SWITCH STATEMENT ABOVE */
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

/*RETURN STHE VALUES OR TITLES OF THE LEFT SIDE OF THE BAR */
SideTitles get lefTitles => SideTitles(
      getTitlesWidget: lefTitlesWidget,
      interval: 1000,
      reservedSize: 40,
      showTitles: true,
    );

/*SAME IDEA WITCH SWITCH CASE STATEMENT FOR BOTTOMTITLES */
Widget lefTitlesWidget(double value, TitleMeta meta) {
  var style = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        "0",
        style: style,
      );
      break;

    case 500:
      text = Text(
        "500",
        style: style,
      );
      break;

    case 1000:
      text = Text(
        "1000",
        style: style,
      );
      break;

    case 1500:
      text = Text(
        "1500",
        style: style,
      );
      break;

    case 2000:
      text = Text(
        "2000",
        style: style,
      );
      break;

    case 2500:
      text = Text(
        "2500",
        style: style,
      );
      break;

    case 3000:
      text = Text(
        "3000",
        style: style,
      );
      break;

    case 3500:
      text = Text(
        "3500",
        style: style,
      );
      break;

    case 4000:
      text = Text(
        "4000",
        style: style,
      );
      break;

    case 4500:
      text = Text(
        "4500",
        style: style,
      );
      break;

    case 5000:
      text = Text(
        "5000",
        style: style,
      );
      break;

    case 5500:
      text = Text(
        "5500",
        style: style,
      );
      break;

    case 6000:
      text = Text(
        "6000",
        style: style,
      );
      break;

    case 6500:
      text = Text(
        "6500",
        style: style,
      );
      break;

    case 7000:
      text = Text(
        "7000",
        style: style,
      );
      break;

    default:
      return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}
