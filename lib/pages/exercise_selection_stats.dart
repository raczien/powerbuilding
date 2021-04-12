import 'package:flutter/material.dart';
import 'package:powerbuilding/constants.dart';
import 'package:powerbuilding/database/db_helper.dart';

import 'chart_test.dart';

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

  Color activeCardColor = kRedThemeColor;
  Color inactiveCardColor = Color(0xFF14171C);
  String selectedCategory;
  String _getExercisePic(String name) {
    switch (name) {
      case 'Benchpress':
        return 'chest/benchpress';
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

  String picked;
  String dropdownMonth = 'SELECT MONTH';
  String dropdownYear = 'SELECT YEAR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedThemeColor,
        title: Text('Select Exercise'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: getAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView.separated(
                    padding: EdgeInsets.all(5),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            picked = all[index];
                          });
                          print('PICKED VALUE: ' + picked);
                        },
                        child: Container(
                          color: picked == all[index]
                              ? activeCardColor
                              : inactiveCardColor,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.0),
                                child: Image(
                                  width: 70,
                                  height: 70,
                                  image: AssetImage(
                                    'images/' +
                                        _getExercisePic(all[index]) +
                                        '.jpg',
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
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: all.length,
                  ),
                );
              } else {
                debugPrint('Step 1, build loading widget');
                return CircularProgressIndicator();
              }
            },
          ),
          Container(
            height: 40,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory == 'ALL'
                          ? selectedCategory = ''
                          : selectedCategory = 'ALL';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: selectedCategory == 'ALL'
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                    height: 50,
                    width: 120,
                    child: Center(
                      child: Text(
                        'ALL',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownYear,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownYear = newValue;
                      });
                    },
                    items: <String>['SELECT YEAR', '2019', '2020', '2021']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownMonth,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownMonth = newValue;
                      });
                    },
                    items: <String>[
                      'SELECT MONTH',
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: kRedThemeColor,
        child: Container(
          height: 70,
          child: GestureDetector(
            child: Center(
              child: Text(
                'GENERATE CHART',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            onTap: () {
              print(DBHelper.getSpecificStats(
                  'workout_exercises', 'Reverse Curl'));
              Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => Exercise_Selection_Stats(),
                  builder: (context) => Chart(type: picked),
                ),
              );
            },
          ),
        ),
      ),
    );

    /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(getAll());
          //print(DBHelper.getEmployees());
        },*/
  }
}
