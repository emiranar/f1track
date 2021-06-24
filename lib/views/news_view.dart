import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:f1track/models/news_model.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget();

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<News_> news = [];

  @override
  void initState() {
    super.initState();
    getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return NewsList();
  }

  Widget NewsList() {
    return news.isNotEmpty
        ? ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: news.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final race = news[index];

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

  void getNewsList() async {
    final response = await http.get(Uri.parse(
        // 'https://newsapi.org/v2/everything?q=formula%1&language=tr&sortBy=popularity&apiKey=9bd7ad3f380e49daa11b772cc0a4771e'
        //'https://newsapi.org/v2/everything?qInTitle=formula&language=tr&sortBy=popularity&apiKey=9bd7ad3f380e49daa11b772cc0a4771e'
        'https://newsapi.org/v2/everything?qInTitle=formula%20OR%20f1&language=tr&apiKey=9bd7ad3f380e49daa11b772cc0a4771e'));

    setState(() {
      if (response.statusCode == 200) {
        var allschedules = json.decode(response.body)['articles'];

        //print(allschedules);
        allschedules.forEach((sch) => news.add(new News_(
              sch['title'],
              sch['description'],
              sch['urlToImage'],
            )));
      }
    });
  }
}
