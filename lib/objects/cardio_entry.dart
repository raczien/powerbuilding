import 'package:flutter/material.dart';
import 'package:powerbuilding/pages/cardio_input.dart';

class CardioEntry extends StatelessWidget {
  CardioEntry(
      {@required this.exercise,
      @required this.name,
      @required this.day,
      @required this.month,
      @required this.year});

  final AssetImage exercise;
  final String name;
  final int day;
  final int month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cardio_Training(
              exercise: name,
              pic: exercise,
              day: day,
              month: month,
              year: year,
            ),
          ),
        );
        print(name);
        print('cardio_entry Routing einfügen');
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: exercise,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
