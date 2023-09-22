import 'package:farm_swap_karl/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarterBarGraph extends StatelessWidget {
  const BarterBarGraph({
    super.key,
  });

  //final List<BarterGraphData> barter1;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchedData,
        titlesData: barTitlesData,
        borderData: barBordersData,
        barGroups: barGroupsData,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }
}

BarTouchData get barTouchedData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (BarChartGroupData group, int groupIndex,
            BarChartRodData rod, int rodIndex) {
          return BarTooltipItem(
            rod.toY.toString(),
            const TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = "Jan";
      break;

    case 1:
      text = "Feb";
      break;

    case 2:
      text = "Mar";
      break;

    case 3:
      text = "Apr";
      break;

    case 4:
      text = "May";
      break;

    case 5:
      text = "Jun";
      break;

    case 6:
      text = "Jul";
      break;

    case 7:
      text = "Aug";
      break;

    case 8:
      text = "Sep";
      break;

    case 9:
      text = "Oct";
      break;

    case 10:
      text = "Nov";
      break;

    case 11:
      text = "Dec";
      break;

    default:
      text = "";
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 2,
    child: Text(
      text,
      style: style,
    ),
  );
}

Widget getLeftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 8,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = "0";
      break;

    case 3:
      text = "500";
      break;

    case 6:
      text = "1000";
      break;

    case 9:
      text = "2000";
      break;

    case 12:
      text = "3000";
      break;

    case 15:
      text = "4000";
      break;

    case 20:
      text = "5000";
      break;

    default:
      text = "";
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 2,
    child: Text(
      text,
      style: style,
    ),
  );
}

FlTitlesData get barTitlesData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getLeftTitles,
          interval: 1,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 20,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    );

FlBorderData get barBordersData => FlBorderData(
      show: false,
    );

List<BarChartGroupData> get barGroupsData => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 8,
            color: farmSwapTitlegreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 10,
            color: farmSwapSmoothGreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 15,
            color: farmSwapTitlegreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: 16,
            color: farmSwapSmoothGreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: 10,
            color: farmSwapTitlegreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: 4,
            color: farmSwapSmoothGreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: 17,
            color: farmSwapTitlegreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 7,
        barRods: [
          BarChartRodData(
            toY: 10,
            color: farmSwapSmoothGreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 8,
        barRods: [
          BarChartRodData(
            toY: 3,
            color: farmSwapTitlegreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 9,
        barRods: [
          BarChartRodData(
            toY: 11,
            color: farmSwapSmoothGreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 10,
        barRods: [
          BarChartRodData(
            toY: 7,
            color: farmSwapTitlegreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 11,
        barRods: [
          BarChartRodData(
            toY: 14,
            color: farmSwapSmoothGreen,
            borderRadius: const BorderRadius.all(Radius.zero),
            width: 15,
          ),
        ],
        //showingTooltipIndicators: [0],
      ),
    ];

class DashBoardBarChart extends StatefulWidget {
  const DashBoardBarChart({super.key});

  @override
  State<DashBoardBarChart> createState() => _DashBoardBarChartState();
}

class _DashBoardBarChartState extends State<DashBoardBarChart> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 4,
      child: BarterBarGraph(),
    );
  }
}
