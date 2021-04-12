import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/database/db_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExerciseData {
  ExerciseData(
      this.id, this.name, this.weight, this.year, this.month, this.day);
  final int id;
  final String name;
  final int weight;
  final int year;
  final int month;
  final int day;
}

class Chart extends StatefulWidget {
  Chart({@required this.type});

  final String type;
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int id = 0;
  final List<ExerciseData> chartData = [];

  Future<List<ExerciseData>> getAll() async {
    final dataList =
        await DBHelper.getSpecificStats('workout_exercises', widget.type);
    dataList.forEach((element) {
      //print(element);

      chartData.add(ExerciseData(id, widget.type, element["weight"],
          element["year"], element["month"], element["day"]));
      print('ChartData: ' + chartData.toString());
      id++;
    });

    return chartData;
  }

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
                      yAxisName: 'Weight',
                      xValueMapper: (ExerciseData exercise, _) => exercise.id,
                      yValueMapper: (ExerciseData exercise, _) =>
                          exercise.weight,
                    ),
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
    );
  }
}
