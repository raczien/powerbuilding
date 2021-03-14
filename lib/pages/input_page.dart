import 'dart:ui';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';

import '../objects/bottom_button.dart';
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
          child: Text('START'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Image(
              image: AssetImage('images/logo/logo.png'),
            ),
          ),
          Expanded(
            child: CalendarTimeline(
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
          ),
          SizedBox(
            height: 40,
          ),
          BottomButton(
            navigate: () {
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
            usage: 'Next',
          ),
          Center(
            child: Text(
              'Selected date is $_selectedDate',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
