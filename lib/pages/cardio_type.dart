import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/objects/cardio_entry.dart';

class Cardio extends StatelessWidget {
  Cardio({@required this.day, @required this.month, @required this.year});
  //comment
  final int day;
  final int month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text('CARDIO WORKOUT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CardioEntry(
                exercise: AssetImage('images/cardio/bike.jpg'),
                name: 'Biking',
                day: day,
                month: month,
                year: year,
              ),
              CardioEntry(
                exercise: AssetImage('images/cardio/rope.jpg'),
                name: 'Skipping',
                day: day,
                month: month,
                year: year,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CardioEntry(
                exercise: AssetImage('images/cardio/crosstrainer.jpg'),
                name: 'Crosstrainer',
                day: day,
                month: month,
                year: year,
              ),
              CardioEntry(
                exercise: AssetImage('images/cardio/rows.jpg'),
                name: 'Rowing',
                day: day,
                month: month,
                year: year,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CardioEntry(
                exercise: AssetImage('images/cardio/stairs.jpg'),
                name: 'Stairs',
                day: day,
                month: month,
                year: year,
              ),
              CardioEntry(
                exercise: AssetImage('images/cardio/tredmill.jpg'),
                name: 'Treadmill',
                day: day,
                month: month,
                year: year,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
