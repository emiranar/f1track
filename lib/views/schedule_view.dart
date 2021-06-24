import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:f1track/models/schedule_model.dart';

class SchedulesWidget extends StatefulWidget {
  SchedulesWidget();

  @override
  _SchedulesWidgetState createState() => _SchedulesWidgetState();
}

class _SchedulesWidgetState extends State<SchedulesWidget> {
  List<Schedule> schedule = [];

  @override
  void initState() {
    super.initState();
    getSchedulesList();
  }

  @override
  Widget build(BuildContext context) {
    return SchedulesList();
  }

  Widget SchedulesList() {
    return schedule.isNotEmpty
        ? ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: schedule.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final race = schedule[index];

              return ListTile(
                title: race.buildSchedule(context),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Center(
                child: CircularProgressIndicator(),
              )
            ],
          );
  }

  //Schedule(this.raceName, this.circuitId, this.raceDate);

  void getSchedulesList() async {
    final response = await http.get(Uri.parse(
        'https://cors-anywhere.herokuapp.com/http://ergast.com/api/f1/current.json'));

    setState(() {
      if (response.statusCode == 200) {
        var allschedules =
            json.decode(response.body)['MRData']['RaceTable']['Races'];

        //print(allschedules);
        allschedules.forEach((sch) => schedule.add(new Schedule(
              sch['Circuit']['Location']['country'],
              sch['raceName'],
              sch['Circuit']['circuitId'],
              sch['date'],
            )));
      }
    });
  }
}
