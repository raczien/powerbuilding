import 'package:flutter/material.dart';
import 'package:powerbuilding/exercise.dart';
import 'file:///C:/Users/lmarczian/AndroidStudioProjects/powerbuilding/lib/objects/listEntry.dart';
import 'package:powerbuilding/divider.dart';

//TODO: GANZE LISTE MIT ALLEN ÜBUNGEN, mit:
//TODO: bool visible = false; if name like bauch: true oder so

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
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/beine.png'),
            name: 'Beine',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bizeps.png'),
            name: 'Bizeps',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
          GroupSplitter(),
          ListEntry(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetails(
                    day: day,
                    month: month,
                    year: year,
                  ),
                ),
              );
            },
            exercise: AssetImage('images/groups/bauch.png'),
            name: 'Bauch',
          ),
        ],
      ),
    );
  }
}
