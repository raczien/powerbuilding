import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingDetails extends StatelessWidget {
  TrainingDetails(
      {@required this.day, @required this.month, @required this.year});

  final int day;
  final int month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B0000),
        title: Center(
          child: Text('Hier Daten eingeben'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text('day = $day, month = $month, year = $year'),
        ),
      ),
    );
  }
}
