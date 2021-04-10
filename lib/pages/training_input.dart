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
  List<String> written = [];
  var concatenate = StringBuffer();
  Future<void> getAll() async {
    final dataList = await DBHelper.getAllSavedExercises('workout_exercises');
    print(dataList);
  }

  void addToWritten(String entry) {
    if (written.length == 1) {
      written.removeAt(0);
      written.add(entry);
      concatenate.clear();
    } else {
      written.add(entry);
      concatenate.clear();
    }
    written.forEach((item) {
      concatenate.write(item);
    });
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
                width: 55,
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
                width: 55,
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
                width: 55,
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
                width: 55,
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
                width: 55,
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
                width: 55,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '$concatenate',
          ),
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
          setState(() {
            addToWritten('Saved Set: ' +
                widget.exercise.sets.toString() +
                ', Rep: ' +
                widget.exercise.reps.toString() +
                ', Weight: ' +
                widget.exercise.weight.toString() +
                ' kg\n');
          });
          print(written);

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
                      DBHelper.truncate();
                    }),*/
