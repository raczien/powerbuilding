import 'package:flutter/material.dart';
import 'package:powerbuilding/objects/muscle_entry.dart';

class MuscleRegion extends StatelessWidget {
  MuscleRegion({@required this.day, @required this.month, @required this.year});

  final int day;
  final int month;
  final int year;
  Color color = Colors.white12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B0000),
        title: Text('Muskelgruppe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListEntry1(
                exercise: AssetImage('images/muscles/back.png'),
                name: 'Back',
                day: day,
                month: month,
                year: year,
              ),
              ListEntry1(
                exercise: AssetImage('images/muscles/biceps.png'),
                name: 'Biceps',
                day: day,
                month: month,
                year: year,
              ),
              ListEntry1(
                exercise: AssetImage('images/muscles/center.png'),
                name: 'Core',
                day: day,
                month: month,
                year: year,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListEntry1(
                exercise: AssetImage('images/muscles/chest.png'),
                name: 'Chest',
                day: day,
                month: month,
                year: year,
              ),
              ListEntry1(
                exercise: AssetImage('images/muscles/forearms.png'),
                name: 'Forearms',
                day: day,
                month: month,
                year: year,
              ),
              ListEntry1(
                exercise: AssetImage('images/muscles/legs.png'),
                name: 'Legs',
                day: day,
                month: month,
                year: year,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListEntry1(
                exercise: AssetImage('images/muscles/shoulders.png'),
                name: 'Shoulders',
                day: day,
                month: month,
                year: year,
              ),
              ListEntry1(
                exercise: AssetImage('images/muscles/triceps.png'),
                name: 'Triceps',
                day: day,
                month: month,
                year: year,
              ),
              ListEntry1(
                exercise: AssetImage('images/muscles/chest.png'),
                name: 'TEST',
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
