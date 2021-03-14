import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 20,
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}
