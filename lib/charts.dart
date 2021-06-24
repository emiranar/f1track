import 'package:flutter/material.dart';
import 'package:f1track/teams_chart.dart';
import 'package:f1track/pilots_chart.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                "Takımlar Şampiyonası",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TeamsChart(),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "Pilotlar Şampiyonası",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              PilotsChart(),
            ],
          ),
        ),
      ),
    );
  }
}
