import 'dart:ui';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';

import 'cardio_type.dart';
import 'muscle_region.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Center(
          child: Text('ADD TRAINING'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MuscleRegion(
                            day: _selectedDate.day,
                            month: _selectedDate.month,
                            year: _selectedDate.year,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 200,
                        width: 150,
                        image: AssetImage('images/logo/lifting_logo.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lifting',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cardio(
                            day: _selectedDate.day,
                            month: _selectedDate.month,
                            year: _selectedDate.year,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 200,
                        width: 150,
                        image: AssetImage('images/logo/cardio_logo.JPG'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Cardio',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CalendarTimeline(
            showYears: true,
            initialDate: _selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
            leftMargin: 20,
            monthColor: Colors.white70,
            dayColor: Colors.white,
            dayNameColor: Colors.white,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: kRedThemeColor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'de',
          ),
          SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
}
