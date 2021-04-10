import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/database/db_helper.dart';
import 'package:powerbuilding/objects/round_icon_button.dart';

class Cardio_Training extends StatefulWidget {
  Cardio_Training(
      {@required this.exercise,
      @required this.pic,
      @required this.day,
      @required this.month,
      @required this.year});

  String exercise;
  final AssetImage pic;
  final int day;
  final int month;
  final int year;
  @override
  _Cardio_TrainingState createState() => _Cardio_TrainingState();
}

class _Cardio_TrainingState extends State<Cardio_Training> {
  int _duration = 30;
  List<String> written = [];
  var concatenate = StringBuffer();
  Future<void> getAll() async {
    final dataList = await DBHelper.getData('cardio_workout');
    print(dataList);
  }

  int kalorien = 0;

  int getKalorien() {
    switch (widget.exercise) {
      case 'Rowing':
        return 566;
      case 'Biking':
        return 484;
      case 'Skipping':
        return 980;
      case 'Crosstrainer':
        return 768;
      case 'Stairs':
        return 612;
      case 'Treadmill':
        return 512;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text('${widget.exercise}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(22.0),
            child: Image(
              image: widget.pic,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'DURATION: ',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              Text(
                '${_duration} min',
                style: TextStyle(
                  fontSize: 35,
                  color: kRedThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (_duration > 0) _duration -= 5;
                    });
                  }),
              SizedBox(
                width: 20.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    if (_duration < 1000) _duration += 5;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'ca. ' +
                (getKalorien() / 60 * _duration).toInt().toString() +
                ' kcl',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            '$concatenate',
          ),
          /*FloatingActionButton(
              heroTag: '3',
              backgroundColor: Colors.red,
              onPressed: () {
                DBHelper.truncate();
              }),*/
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kRedThemeColor,
        heroTag: '1',
        child: Icon(
          Icons.check,
          size: 40,
        ),
        onPressed: () {
          setState(() {});
          print(
            (getKalorien() / 60 * _duration).toInt().toString(),
          );

          DBHelper.insert('cardio_workout', {
            'name': widget.exercise,
            'duration': _duration,
            'day': widget.day,
            'month': widget.month,
            'year': widget.year,
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

/*Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                */ /*FloatingActionButton(
                    heroTag: '2',
                    backgroundColor: Colors.yellow,
                    onPressed: () {
                      getAll();
                    }),*/ /*
                */ /*FloatingActionButton(
                    heroTag: '3',
                    backgroundColor: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LineChartWidget(
                            name: 'Test',
                          ),
                        ),
                      );
                    }),*/ /*
                */ /*FloatingActionButton(
                    heroTag: '3',
                    backgroundColor: Colors.red,
                    onPressed: () {
                      DBHelper.truncate();
                    }),*/ /*
              ],
            ),
          ),*/

/*FloatingActionButton(
                    heroTag: '2',
                    backgroundColor: Colors.yellow,
                    onPressed: () {
                      getAll();
                    }),*/
/*FloatingActionButton(
                    heroTag: '3',
                    backgroundColor: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LineChartWidget(
                            name: 'Test',
                          ),
                        ),
                      );
                    }),*/
/*FloatingActionButton(
                    heroTag: '3',
                    backgroundColor: Colors.red,
                    onPressed: () {
                      DBHelper.truncate();
                    }),*/
