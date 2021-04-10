import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/database/db_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}

class ExerciseData {
  ExerciseData(this.name, this.weight, this.year, this.month, this.day);
  final String name;
  final int weight;
  final int year;
  final int month;
  final int day;
}

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<String> all = [];

  Future<List<String>> getAll() async {
    all.clear();
    final dataList =
        await DBHelper.getSpecificStats('workout_exercises', 'Reverse Curl');
    dataList.forEach((element) {
      print(element);
      all.add(element["weight"].toString());

      chartData.add(ExerciseData('Reverse Curl', element["weight"],
          element["year"], element["month"], element["day"]));
    });
    print(all);
    return all;
  }

  final List<ExerciseData> chartData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text(
          'Test',
        ),
      ),
      body: FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                child: SfCartesianChart(
                  series: <ChartSeries>[
                    // Renders line chart
                    LineSeries<ExerciseData, int>(
                        dataSource: chartData,
                        xValueMapper: (ExerciseData sales, _) => sales.day,
                        yValueMapper: (ExerciseData sales, _) => sales.weight)
                  ],
                ),
              ),
            );
          } else {
            debugPrint('Step 1, build loading widget');
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getAll,
      ),
    );
  }
}
