import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  const Hakkinda({Key? key}) : super(key: key);

  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
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
                "\nBu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301073 numaralı Emir ANAR tarafından 25 Haziran 2021 günü yapılmıştır.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
