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

import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    Key? key,
    this.width,
    this.height,
    required this.dCalories,
    required this.neededCalories,
    required this.dates,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<double> dCalories;
  final double neededCalories;
  final List<DateTime> dates;

  @override
  _ColumnChartState createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  @override
  Widget build(BuildContext context) {
    List<MapEntry<DateTime, double>> dCaloriesData = widget.dCalories
        .asMap()
        .entries
        .map((entry) => MapEntry(widget.dates[entry.key], entry.value))
        .toList();

    // Create a fixed line for needed calories
    List<MapEntry<DateTime, double>> neededCaloriesData = List.generate(
      widget.dCalories.length,
      (index) => MapEntry(widget.dates[index], widget.neededCalories),
    );

    double minYValue = 0; // Ensure the minimum Y value is 0
    double maxYValue = widget.dCalories.reduce((a, b) => a > b ? a : b);

    // Extend the max Y value to provide some padding
    maxYValue = maxYValue + 100;

    return Container(
      width: widget.width,
      height: widget.height,
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat('dd/MM'), // Format the date as you prefer
        ),
        primaryYAxis: NumericAxis(
          minimum: minYValue,
          maximum: maxYValue,
          interval: 100, // Interval of 100 for clearer labels
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true, // Enable panning
          zoomMode: ZoomMode.x, // Enable zooming in X direction only
        ),
        series: <CartesianSeries>[
          ColumnSeries<MapEntry<DateTime, double>, DateTime>(
            dataSource: dCaloriesData,
            xValueMapper: (entry, _) => entry.key,
            yValueMapper: (entry, _) => entry.value,
            name: 'Daily Calories',
            markerSettings: MarkerSettings(isVisible: true),
          ),
          LineSeries<MapEntry<DateTime, double>, DateTime>(
            dataSource: neededCaloriesData,
            xValueMapper: (entry, _) => entry.key,
            yValueMapper: (entry, _) => entry.value,
            name: 'Needed Calories',
            dashArray: <double>[5, 5], // Makes the needed calories line dashed
            markerSettings: MarkerSettings(isVisible: true),
          ),
        ],
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom, // Position the legend at the bottom
          overflowMode: LegendItemOverflowMode.wrap, // Wrap legend items
          height: '50px', // Adjust height as needed
        ),
      ),
    );
  }
}
