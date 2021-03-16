import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powerbuilding/exerceses_grouped.dart';
import 'package:powerbuilding/exercises.dart';
import 'package:powerbuilding/pages/training_input.dart';

import 'constants.dart';

class TrainingDetails extends StatelessWidget {
  TrainingDetails(
      {@required this.name,
      @required this.day,
      @required this.month,
      @required this.year});

  final String name;
  final int day;
  final int month;
  final int year;

  List<Exercises> _getCurrentMuscleGroup() {
    switch (name) {
      case 'Back':
        return back;
      case 'Biceps':
        return biceps;
      case 'Core':
        return core;
      case 'Chest':
        return chest;
      case 'Forearms':
        return forearms;
      case 'Legs':
        return legs;
      case 'Shoulders':
        return shoulders;
      case 'Triceps':
        return triceps;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text('$name Exercises'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(5),
        itemCount: _getCurrentMuscleGroup().length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Training(
                    exercise: _getCurrentMuscleGroup()[index],
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: Image(
                    image: _getCurrentMuscleGroup()[index].pic,
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    '${_getCurrentMuscleGroup()[index].name}',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
