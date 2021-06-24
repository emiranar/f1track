import 'dart:ui';
import 'package:f1track/register.dart';
import 'package:flutter/material.dart';
import 'package:f1track/views/pilots_view.dart';
import 'package:f1track/views/teams_view.dart';
import 'package:f1track/views/schedule_view.dart';
import 'package:f1track/views/news_view.dart';
import 'package:f1track/login.dart';
import 'package:f1track/hakkinda.dart';
import 'package:f1track/charts.dart';
import 'package:animations/animations.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

int seciliSayfa = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(255, 24, 1, .1),
      100: Color.fromRGBO(255, 24, 1, .2),
      200: Color.fromRGBO(255, 24, 1, .3),
      300: Color.fromRGBO(255, 24, 1, .4),
      400: Color.fromRGBO(255, 24, 1, .5),
      500: Color.fromRGBO(255, 24, 1, .6),
      600: Color.fromRGBO(255, 24, 1, .7),
      700: Color.fromRGBO(255, 24, 1, .8),
      800: Color.fromRGBO(255, 24, 1, .9),
      900: Color.fromRGBO(255, 24, 1, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFFFF1801, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F1Track',
      theme:
          ThemeData(primarySwatch: colorCustom, bottomAppBarColor: colorCustom),
      home: MyHomePage(title: 'F1Track'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: LoginPage(), // sayfaGoster(seciliSayfa),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TumSayfalar extends StatefulWidget {
  @override
  _TumSayfalarState createState() => _TumSayfalarState();
}

class _TumSayfalarState extends State<TumSayfalar> {
  Widget sayfaGoster(int SayfaNo) {
    if (SayfaNo == -2) return RegisterPage();
    if (SayfaNo == -1) return LoginPage();
    if (SayfaNo == 0) return Anasayfa();
    if (SayfaNo == 1) return SchedulesWidget();
    if (SayfaNo == 2) return DriversWidget();
    if (SayfaNo == 3) return TeamsWidget();
    if (SayfaNo == 4) return Charts();
    if (SayfaNo == 5) return Hakkinda();

    return LoginPage();
  }

  void sayfaDegistir(int SayfaNo) {
    setState(() {
      timeDilation = 5;
      seciliSayfa = SayfaNo;
      // print("sayfa no degisti");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("F1Track"),
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: sayfaGoster(seciliSayfa),
      ),

      bottomNavigationBar: (seciliSayfa >= 0)
          ? Container(
              child: BottomNavigationBar(
                currentIndex: seciliSayfa,
                onTap: sayfaDegistir,
                type: BottomNavigationBarType.fixed,
                fixedColor: Theme.of(context).primaryColor,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text(
                      'Anasayfa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.date_range),
                    title: Text(
                      'Takvim',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_motorsports),
                    title: Text(
                      'Pilotlar',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    title: Text(
                      'Takımlar',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.graphic_eq),
                    title: Text(
                      'Grafik',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    title: Text(
                      'Hakkında',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          : null,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final emailController = TextEditingController();
final sifreController = TextEditingController();

Widget Anasayfa() {
  return NewsWidget();
}
