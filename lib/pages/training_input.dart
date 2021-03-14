import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/exercises.dart';
import 'package:powerbuilding/objects/round_icon_button.dart';

class Training extends StatefulWidget {
  Training(
      {@required this.exercise,
      @required this.day,
      @required this.month,
      @required this.year});

  Exercises exercise;
  int day;
  int month;
  int year;
  @override
  _TrainingState createState() => _TrainingState();
}

//TODO: OBEN GENANNTE FELDER SIND MIT "widget.X" erreichbar.
class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Center(
          child: Text('${widget.exercise.name}'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: widget.exercise.pic,
          ),
          Text(widget.exercise.name),
          Text('REPS: ${widget.exercise.reps}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
            ],
          ),
        ],
      ),
    );
  }
}
