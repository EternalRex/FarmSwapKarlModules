import 'package:farm_swap_karl/pages/dashboard_page/data/test_data/dsb_pie_graph/piegraph.dart';
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class DashBoardPieChart extends StatefulWidget {
  const DashBoardPieChart({super.key});

  @override
  State<DashBoardPieChart> createState() => _DashBoardPieChartState();
}

class _DashBoardPieChartState extends State<DashBoardPieChart> {
  @override
  Widget build(BuildContext context) {
    /*RETURNING A PIE CHART TO THE DASHBOARD PAGE */
    return Container(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: 200,
            child: Container(
              //color: Colors.blue,
              child: PieChart(
                /*PUTTING DATA INTO THE PIE CHART */
                PieChartData(
                  /*THE DATA ARE STORED IN THIS SECTIONS PROPERTY, WE PASSED ON A 
                  GETSECTIONS METHOD THAT WILL MAP THE VALUES WE GOT FROM A DATA CLASS
                  AND CONVERTS IT INTO A LIST */
                  sections: getSections(),
                  /*MAKING THE CIRCLE THICK BY INCREASING THE RADIUS OF THE SECTIONS */
                  centerSpaceRadius: 40,
                ),
              ),
            ),
          ),
          /*A WIDGET THAT ADDS LABEL TO OUR GRAPH */
          const PieGraphIndicatorWidget(),
        ],
      ),
    );
  }
}

/*A GETSECTIONS FUNCTION OF TYPE PIECHARTSECTIONDATA THAT RETURNS A LIST OF PIECHARTSECTIONDATA AS
INDICATED IN THE .TOLIST()*/
List<PieChartSectionData> getSections() => PieDataContent.data
/*FUNCTION CALLS THE ASMAP FUNCTION THAT CONVERTS THE LIST OF OBJECT IN THE PIEDATACONTENT
CLASS INTO A MAP */
    .asMap()
    /*THEN IT USES THE MAP METHOD TO LOOP INSIDE THE PIEDATACONTENT OBJECTS AND ASSIGN
    AN INT INDEX TO EACH OBJECTS, SO THE CONDITION PRESENTED BELOW IS 
     ITS LIKE FOR EVERY INTEGER KEY, THERE IS A PIECHARTSECTIONDATA DATA */
    .map<int, PieChartSectionData>((key, data) {
      /*A VALUE THAT CONTAINS THE VALUE OF PIE CHART'S SECTION BY ACCESSING THE 
      OBJECTS INSIDE THE PIEDATACONTENT CLASS USING THE WORD DATA.*/
      final value = PieChartSectionData(
        color: data.color,
        title: "${data.percent.toInt()}%",
        value: data.percent,
        titleStyle: TextStyle(
            fontSize: 16,
            fontFamily: GoogleFonts.viga().fontFamily,
            fontWeight: FontWeight.bold),
      );
      /*RETUNS THE KEY/INDEX AND ITS PAIRED VALUE */
      return MapEntry(key, value);
    })
    .values
    .toList();

/*BUILDING A WIDGET CALLED INDICATOR TO PUT MORE LABELS ON THE GRAPH */
class PieGraphIndicatorWidget extends StatelessWidget {
  const PieGraphIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: PieDataContent.data
          .map(
            (data) => Container(
              //color: Colors.red,
              height: 100,
              width: 180,
              child: actualIndicators(
                  data: data.percent, color: data.color, text: data.name),
            ),
          )
          .toList(),
    );
  }

  actualIndicators({
    required Color color,
    required String text,
    double size = 16,
    Color textColor = Colors.black87,
    required data,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
          Text(
            "${data.toInt()}% MONTHLY",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.viga().fontFamily),
          ),
        ],
      );
}
