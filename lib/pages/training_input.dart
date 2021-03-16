import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/database/db_helper.dart';
import 'package:powerbuilding/exercises.dart';
import 'package:powerbuilding/objects/round_icon_button.dart';

class Training extends StatefulWidget {
  Training(
      {@required this.exercise,
      @required this.day,
      @required this.month,
      @required this.year});

  Exercises exercise;
  final int day;
  final int month;
  final int year;
  @override
  _TrainingState createState() => _TrainingState();
}

//TODO: OBEN GENANNTE FELDER SIND MIT "widget.X" erreichbar.
class _TrainingState extends State<Training> {
  Future<void> getAll() async {
    final dataList = await DBHelper.getData('workout_exercises');
    print(dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text('${widget.exercise.name}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(22.0),
            child: Image(
              image: widget.exercise.pic,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 60,
              ),
              Expanded(
                child: Text(
                  'SET: ',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              Text(
                '${widget.exercise.sets}',
                style: TextStyle(
                  fontSize: 35,
                  color: kRedThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (widget.exercise.sets > 0) widget.exercise.sets--;
                    });
                    print(widget.exercise.sets);
                  }),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    if (widget.exercise.sets < 100) widget.exercise.sets++;
                  });
                },
              ),
              SizedBox(
                width: 60,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 60,
              ),
              Expanded(
                child: Text(
                  'REPS: ',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              Text(
                '${widget.exercise.reps}',
                style: TextStyle(
                  fontSize: 35,
                  color: kRedThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (widget.exercise.reps > 0) widget.exercise.reps--;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    if (widget.exercise.reps < 100) widget.exercise.reps++;
                  });
                },
              ),
              SizedBox(
                width: 60,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 60,
              ),
              Expanded(
                child: Text(
                  'WEIGHT:',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              Text(
                '${widget.exercise.weight}',
                style: TextStyle(
                  fontSize: 35,
                  color: kRedThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (widget.exercise.weight > 0)
                        widget.exercise.weight -= 2;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  setState(() {
                    if (widget.exercise.weight < 1000)
                      widget.exercise.weight += 2;
                  });
                },
              ),
              SizedBox(
                width: 60,
              ),
            ],
          ),
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              //exercise TEXT, set INTEGER, reps INTEGER, weight INTEGER,
              // day INTEGER, month INTEGER, year INTEGER
              print('name: ${widget.exercise.name}, '
                  '\nset: ${widget.exercise.sets}, '
                  '\nreps: ${widget.exercise.reps}, '
                  '\nweight: ${widget.exercise.weight}, '
                  '\nday: ${widget.day},'
                  '\nset: ${widget.month},'
                  '\nset: ${widget.year}');

              DBHelper.insert('workout_exercises', {
                'name': widget.exercise.name,
                'sets': widget.exercise.sets,
                'reps': widget.exercise.reps,
                'weight': widget.exercise.weight,
                'day': widget.day,
                'month': widget.month,
                'year': widget.year,
              });
            },
          ),
          FloatingActionButton(
              heroTag: '2',
              backgroundColor: Colors.yellow,
              onPressed: () {
                getAll();
              }),
        ],
      ),
    );
  }
}
