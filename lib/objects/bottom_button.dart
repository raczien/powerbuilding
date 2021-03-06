import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.navigate, @required this.usage});

  final Function navigate;
  final String usage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Container(
          child: Center(
            child: Text(
              usage,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          color: kRedThemeColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: 50,
        ),
      ),
    );
  }
}
