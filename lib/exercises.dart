import 'package:flutter/cupertino.dart';

class Exercises {
  Exercises(
      {@required this.pic,
      @required this.name,
      @required this.reps,
      @required this.sets,
      @required this.weight});

  AssetImage pic;
  String name;
  int reps;
  int sets;
  int weight;

  void setDetails(n, r, s, w) {
    name = n;
    reps = r;
    sets = s;
    weight = w;
  }

  List<int> getDetails() {
    List<int> details;
    details.add(reps);
    details.add(sets);
    details.add(weight);
    return details;
  }

  String getName() {
    return name;
  }
}
