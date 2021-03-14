import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powerbuilding/exerceses_grouped.dart';
import 'package:powerbuilding/exercises.dart';

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
    print('func get called');
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
        return chest;
      case 'Shoulders':
        return chest;
      case 'Triceps':
        return chest;
      case 'Test':
        return chest;
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
          return Row(
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
              Text(
                '${_getCurrentMuscleGroup()[index].name}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
