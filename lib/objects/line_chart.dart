import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({this.name});

  final String name;

  List<FlSpot> hi = [
    FlSpot(0, 5),
    FlSpot(1, 3),
    FlSpot(2, 5),
    FlSpot(3, 8),
    FlSpot(4, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 20,
        lineBarsData: [
          LineChartBarData(
            spots: [hi[0], hi[1]],
          ),
        ],
      ),
    );
  }
}
