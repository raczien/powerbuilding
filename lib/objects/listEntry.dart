import 'package:flutter/material.dart';

class ListEntry extends StatelessWidget {
  ListEntry(
      {@required this.exercise, @required this.name, @required this.onPress});

  final AssetImage exercise;
  final String name;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                fontSize: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
