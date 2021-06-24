import 'package:flutter/material.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildDriver(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class Driver implements ListItem {
  final String position;
  final String points;
  final String name;
  final String surname;
  final String number;
  final String code;
  final String team;

  Driver(this.position, this.points, this.name, this.surname, this.number,
      this.code, this.team);

  Widget buildDriver(BuildContext context) {
    return PilotWidget(position, points, name, surname, number, code, team);

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
                // child: PilotWidget(wins),
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
  Widget PilotWidget(String position, String points, String name,
      String surname, String number, String code, String team) {
    return Container(
      height: 400,
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
                    flex: 3,
                    child: Text(
                      points + "\nPUAN",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/Pilots/' + code + '.png',
                      alignment: Alignment.center,
                      height: 300,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Text(
              name + " " + surname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              code + " // " + number,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                team,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
