import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';

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
  MyHomePage({Key key, this.title}) : super(key: key);
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
      body: GirisPage(), // sayfaGoster(seciliSayfa),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class GirisPage extends StatefulWidget {
  @override
  _GirisPageState createState() => _GirisPageState();
}

class TumSayfalar extends StatefulWidget {
  @override
  _TumSayfalarState createState() => _TumSayfalarState();
}

class _TumSayfalarState extends State<TumSayfalar> {
  Widget sayfaGoster(int SayfaNo) {
    if (SayfaNo == -1) return GirisPage();
    if (SayfaNo == 0) return Anasayfa();
    if (SayfaNo == 1) return TakvimPage();
    if (SayfaNo == 2) return PilotlarPage();
    if (SayfaNo == 3) return TakimlarPage();
    if (SayfaNo == 4) return AyarlarPage();
  }

  void sayfaDegistir(int SayfaNo) {
    setState(() {
      seciliSayfa = SayfaNo;
      print("sayfa no degisti");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("F1Track"),
      ),
      body: sayfaGoster(seciliSayfa),

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

final isimController = TextEditingController();

class _GirisPageState extends State<GirisPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 300, 15, 15),
      child: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                "F1Track",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              Text(
                "Giriş",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextFormField(
                controller: isimController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Adınızı girin',
                  helperMaxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                  label: Text('Giriş Yap'),
                  icon: Icon(Icons.login),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TumSayfalar()),
                    ),
                    SweetAlert.show(context,
                        style: SweetAlertStyle.success,
                        title: "Giriş Başarılı",
                        subtitle: "Hoşgeldin " + isimController.text),
                    SweetAlertOptions(
                      confirmButtonText: "HB",
                      confirmButtonColor: Colors.red,
                    )
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Anasayfa() {
  return ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return Column(
        children: [
          for (var i = 0; i < 10; i++)
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 150,
              width: double.maxFinite,
              child: HaberWidget(),
            ),
        ],
      );
    },
  );
}

Widget TakvimPage() {
  return ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return Column(
        children: [
          for (var i = 0; i < 10; i++)
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 150,
              width: double.maxFinite,
              child: TakvimYarisWidget(),
            ),
        ],
      );
    },
  );
}

Widget PilotlarPage() {
  return Center(
    child: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            for (var i = 0; i < 10; i++)
              Container(
                padding: EdgeInsets.fromLTRB(75, 10, 75, 0),
                height: 250,
                width: double.maxFinite,
                child: PilotWidget(),
              ),
          ],
        );
      },
    ),
  );
}

Widget TakimlarPage() {
  return Center(
    child: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            for (var i = 0; i < 10; i++)
              Container(
                padding: EdgeInsets.fromLTRB(75, 10, 75, 0),
                height: 250,
                width: double.maxFinite,
                child: TakimWidget(),
              ),
          ],
        );
      },
    ),
  );
}

Widget AyarlarPage() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Center(
      child: Container(
        child: Column(
          children: [
            Text(
              "Hakkında",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "\nBu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301073 numaralı Emir ANAR tarafından 30 Nisan 2021 günü yapılmıştır.",
            ),
          ],
        ),
      ),
    ),
  );
}

Widget HaberWidget() {
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
                        "Haber Başlığı",
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
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 10),
                      child: Text(
                        "Haber açıklaması lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet",
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
                child: Image(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn-1.motorsport.com/images/amp/63v5Gg7Y/s500/formula-1-emilia-romagna-gp-20-2.jpg'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget TakvimYarisWidget() {
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
                        "30-02 NİSAN-MAYIS",
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
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 10),
                      child: Text(
                        "Portekiz - Formula 1 Heineken Grande Prémio De Portugal 2021",
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
                child: Image(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxb5Ycvej-WZ1fy2KYNMio3UCjRjax7nWN-Q&usqp=CAU'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget PilotWidget() {
  return Container(
    height: 900,
    child: Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  alignment: Alignment.center,
                  //  width: 250,
                  height: 400,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn-9.motorsport.com/images/mgl/6xEDbp10/s8/lewis-hamilton-mercedes-1.jpg'),
                ),
              ),
            ),
          ),
          Text(
            "Lewis Hamilton",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Mercedes-AMG Petronas Formula One Team",
            ),
          ),
        ],
      ),
    ),
  );
}

Widget TakimWidget() {
  return Container(
    height: 900,
    child: Card(
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  alignment: Alignment.center,
                  //  width: 250,
                  height: 400,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/f/fa/Mercedes-Benz_AMG_Petronas_Formula_One_Team_Logo_Wheelsology.JPG'),
                ),
              ),
            ),
          ),
          Text(
            "Mercedes-AMG Petronas Formula One Team",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "25 Puan",
            ),
          ),
        ],
      ),
    ),
  );
}
