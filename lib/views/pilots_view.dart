import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:f1track/models/pilots_model.dart';

class DriversWidget extends StatefulWidget {
  DriversWidget();

  @override
  _DriversWidgetState createState() => _DriversWidgetState();
}

class _DriversWidgetState extends State<DriversWidget> {
  List<Driver> drivers = [];

  @override
  void initState() {
    super.initState();
    getDriversList();
  }

  @override
  Widget build(BuildContext context) {
    return driversList();
  }

  Widget driversList() {
    return drivers.isNotEmpty
        ? ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: drivers.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final driver = drivers[index];

              return ListTile(
                title: driver.buildDriver(context),
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

  //Driver(this.position, this.points, this.name, this.surname, this.number,

  void getDriversList() async {
    final response = await http.get(
        Uri.parse('https://ergast.com/api/f1/current/driverStandings.json'));

    setState(() {
      if (response.statusCode == 200) {
        var allDrivers = json.decode(response.body)['MRData']['StandingsTable']
            ['StandingsLists'][0]['DriverStandings'];
        allDrivers.forEach((driver) => drivers.add(new Driver(
            driver['position'],
            driver['points'],
            driver['Driver']['givenName'],
            driver['Driver']['familyName'],
            driver['Driver']['permanentNumber'],
            driver['Driver']['code'],
            driver['Constructors'][0]['name'])));
      }
    });
  }
}
