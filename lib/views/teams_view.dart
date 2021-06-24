import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:f1track/models/teams_model.dart';
import 'package:f1track/teams_chart.dart';

class TeamsWidget extends StatefulWidget {
  TeamsWidget();

  @override
  _TeamsWidgetState createState() => _TeamsWidgetState();
}

class _TeamsWidgetState extends State<TeamsWidget> {
  List<Team> teams = [];

  @override
  void initState() {
    super.initState();
    getTeamsList();
  }

  @override
  Widget build(BuildContext context) {
    return TeamsList();
  }

  Widget TeamsList() {
    return teams.isNotEmpty
        ? ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: teams.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final team = teams[index];

              return ListTile(
                title: team.buildTeam(context),
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

  //Team(this.position, this.points, this.name, this.surname, this.number,

  void getTeamsList() async {
    final response = await http.get(Uri.parse(
        'https://ergast.com/api/f1/current/ConstructorStandings.json'));

    setState(() {
      if (response.statusCode == 200) {
        var allTeams = json.decode(response.body)['MRData']['StandingsTable']
            ['StandingsLists'][0]['ConstructorStandings'];
        allTeams.forEach((team) => teams.add(new Team(
            team['position'],
            team['points'],
            team['Constructor']['name'],
            team['Constructor']['constructorId'])));
      }
    });
  }
}
