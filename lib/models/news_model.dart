import 'package:flutter/material.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildSchedule(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class News_ implements ListItem {
  final String title;
  final String desc;
  final String imgurl;

  News_(this.title, this.desc, this.imgurl);

  Widget buildSchedule(BuildContext context) {
    return NewsWidget(title, desc, imgurl);
  }

  Widget NewsWidget(String title, String desc, String imgurl) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
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
                          padding: const EdgeInsets.only(left: 25, top: 15),
                          child: Text(
                            title.length > 38
                                ? title.substring(0, 38) + '...'
                                : title,
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                              left: 25, top: 10, right: 10),
                          child: Text(
                            desc.length > 120
                                ? desc.substring(0, 120) + '...'
                                : desc,
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
                  padding: const EdgeInsets.only(right: 15, top: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      alignment: Alignment.centerRight,
                      fit: BoxFit.cover,
                      image: NetworkImage(imgurl),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
