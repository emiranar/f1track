import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTeam(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class Team implements ListItem {
  final String position;
  final String points;
  final String name;
  final String teamid;

  Team(this.position, this.points, this.name, this.teamid);

  Widget buildTeam(BuildContext context) {
    return TeamWidget(position, points, name, teamid);

    /*Center(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(75, 10, 75, 0),
                height: 250,
                width: double.maxFinite,
                // child: TeamWidget(wins),
              ),
            ],
          );
        },
      ),
    );*/

    /*Card(
        child: Column(
      children: <Widget>[
        ListTile(
            leading: Text(position),
            title: Text("$position $position"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => details(),
                ),
              );
            })
      ],
    ));*/
  }

/*
  String getName() {
    return "$givenName $familyName";
  }

  Widget details() {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
            title: new Column(children: <Widget>[
          new Text(position),
          new Text(points),
          new Text(wins)
        ]))
      ],
    ));
  }
}*/
  Widget TeamWidget(
      String position, String points, String name, String teamid) {
    return Container(
      height: 300,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 5, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFF1801), shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          position,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Text(
                        points + "\nPUAN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/Teams/' + teamid + '.png',
                      alignment: Alignment.center,
                      height: 200,
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
