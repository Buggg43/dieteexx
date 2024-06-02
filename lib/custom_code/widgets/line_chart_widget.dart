// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class LineChartWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final List<double> dCalories;
  final double neededCalories;
  final List<DateTime> dates;

  LineChartWidget({
    Key? key,
    this.width,
    this.height,
    required this.dCalories,
    required this.neededCalories,
    required this.dates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure there is data to display
    if (dCalories.isEmpty || dates.isEmpty) {
      return Center(child: Text('Brak danych do wyświetlenia'));
    }

    double maxYValue = dCalories.reduce((a, b) => a > b ? a : b) + 100;

    return Container(
      width: width ?? double.infinity,
      height: height ?? 400,
      padding: EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: (value, meta) {
                  DateTime date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Text(
                    DateFormat('dd/MM').format(date),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Colors.white, width: 1),
              bottom: BorderSide(color: Colors.white, width: 1),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(dCalories.length, (index) {
                return FlSpot(
                  dates[index].millisecondsSinceEpoch.toDouble(),
                  dCalories[index].isFinite && dCalories[index] >= 0
                      ? dCalories[index]
                      : 0,
                );
              }),
              isCurved: true,
              preventCurveOverShooting: true,
              color: Colors.blue,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: true),
            ),
            LineChartBarData(
              spots: List.generate(dates.length, (index) {
                return FlSpot(
                  dates[index].millisecondsSinceEpoch.toDouble(),
                  neededCalories,
                );
              }),
              isCurved: true,
              preventCurveOverShooting: true,
              color: Colors.red,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: true),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipRoundedRadius: 8,
              tooltipPadding: const EdgeInsets.all(8),
              tooltipMargin: 8,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((touchedSpot) {
                  final date = DateFormat('dd/MM').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          touchedSpot.x.toInt()));
                  return LineTooltipItem(
                    '$date\n${touchedSpot.y.toStringAsFixed(1)}',
                    TextStyle(
                      color: Colors.white,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          minY: 0,
          maxY: maxYValue,
        ),
      ),
    );
  }
}
