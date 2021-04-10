import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/database/db_helper.dart';

class Exercise_Selection_Stats extends StatefulWidget {
  @override
  _Exercise_Selection_StatsState createState() =>
      _Exercise_Selection_StatsState();
}

class _Exercise_Selection_StatsState extends State<Exercise_Selection_Stats> {
  List<String> all = [];
  Future<List<String>> getAll() async {
    all.clear();
    final dataList = await DBHelper.getAllSavedExercises('workout_exercises');
    dataList.forEach((element) {
      all.add(element["name"].toString());
    });
    all.sort();
    print(all);
    return all;
  }

  String _getExercisePic(String name) {
    switch (name) {
      case 'Benchpress':
        return 'chest/benchPress';
      case 'Inclined Benchpress':
        return 'chest/inclined_benchpress';
      case 'Chest Press (Machine)':
        return 'chest/chest_press';
      case 'Dunbell Flys':
        return 'chest/dunbell_flys';
      case 'Cable Flys':
        return 'chest/cable_flys';
      case 'Cable Flys (low)':
        return 'chest/low_flys';
      case 'Cable Flys (high)':
        return 'chest/upper_flys';
      case 'Inclined Dunbell':
        return 'chest/inclined_dunbell';
      case 'Pullover':
        return 'chest/pullover';
      case 'Chest Press (upwards)':
        return 'chest/upward_chest_push';
      case 'Barbell Curls':
        return 'biceps/barbell_curl';
      case 'Hammer Curls':
        return 'biceps/hammer_curls';
      case 'Curls':
        return 'biceps/curls';
      case 'SZ- Curls':
        return 'biceps/sz_curl';
      case 'Concentration Curls':
        return 'biceps/concentration_curls';
      case 'Curls (inclined)':
        return 'biceps/curls_inclined';
      case 'Lat- Pull':
        return 'back/lat_pull';
      case 'Pullups':
        return 'back/pullup';
      case 'Deadlift':
        return 'back/deadlift';
      case 'Rows (cable)':
        return 'back/cable_row';
      case 'Lat- Pull (machine)':
        return 'back/machine_lat_pull';
      case 'Lat Concentration':
        return 'back/lat_front';
      case 'Butterfly reverse':
        return 'back/reverse_fly';
      case 'Cable reverse Fly':
        return 'back/cable_reverse';
      case 'Barbell Rows':
        return 'back/barbell_rows';
      case 'Dunbell Rows':
        return 'back/dunbell_rows';
      case 'Face Pulls':
        return 'back/face_pulls';
      case 'Crunches (machine)':
        return 'core/crunch_machine';
      case 'Situps (inclined)':
        return 'core/inclined_situp';
      case 'Raised Legs':
        return 'core/leg_fall';
      case 'Extension':
        return 'forearms/extension';
      case 'Reverse Curl':
        return 'forearms/reverse_curl';
      case 'Leg Press':
        return 'legs/leg_press';
      case 'Squad':
        return 'legs/squad';
      case 'Smiths Squad':
        return 'legs/smiths_squad';
      case 'Leg Extensions':
        return 'legs/leg_extensions';
      case 'Leg Pulls':
        return 'legs/leg_pulls';
      case 'Calves':
        return 'legs/calves';
      case 'Shoulder Press':
        return 'shoulders/shoulder_press';
      case 'Side Raise (Dunbell)':
        return 'shoulders/side_raise';
      case 'Side Raise (Cable)':
        return 'shoulders/shoulder_side_raise';
      case 'Front Raise':
        return 'shoulders/front_raise';
      case 'French Press':
        return 'triceps/french_press';
      case 'Overhead Extension':
        return 'triceps/overhead_extension';
      case 'Pushdowns':
        return 'triceps/pushdowns';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text('Select Exercise'),
      ),
      body: FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print('hi');
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22.0),
                          child: Image(
                            width: 70,
                            height: 70,
                            image: AssetImage(
                              'images/' + _getExercisePic(all[index]) + '.jpg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          all[index],
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: all.length,
            );
          } else {
            debugPrint('Step 1, build loading widget');
            return CircularProgressIndicator();
          }
        },
      ),

      /*ListView.separated(
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: getAll(),
        ),*/
    );
    /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(getAll());
          //print(DBHelper.getEmployees());
        },*/
  }
}
