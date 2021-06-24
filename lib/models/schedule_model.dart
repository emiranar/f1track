import 'package:flutter/material.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildSchedule(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class Schedule implements ListItem {
  final String country;
  final String raceName;
  final String circuitId;
  final String raceDate;

  Schedule(this.country, this.raceName, this.circuitId, this.raceDate);

  Widget buildSchedule(BuildContext context) {
    return ScheduleWidget(country, raceName, circuitId, raceDate);
  }

  Widget ScheduleWidget(
      String country, String raceName, String circuitId, String raceDate) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          raceDate,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFFFF1801)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10),
                        child: Text(
                          country,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 25, top: 10, right: 10, bottom: 25),
                        child: Text(
                          raceName,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/Circuits/' + circuitId + '.png',
                      alignment: Alignment.center,
                      //height: 300,
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
