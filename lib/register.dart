import 'package:f1track/main.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:f1track/services/auth/auth_methods.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 250, 15, 15),
      child: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                "F1Track",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              Text(
                "Kayıt",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-posta',
                  helperMaxLines: 1,
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: sifreController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Şifre',
                  helperMaxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                  label: Text('Kayıt Ol'),
                  icon: Icon(Icons.how_to_reg_rounded),
                  onPressed: () async {
                    var basarili = await register(
                        emailController.text, sifreController.text);
                    if (basarili) {
                      seciliSayfa = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TumSayfalar()),
                      );
                      SweetAlert.show(context,
                          style: SweetAlertStyle.success,
                          title: "Kayıt Başarılı",
                          subtitle: "Hoşgeldin " + emailController.text);
                    } else {
                      SweetAlert.show(context,
                          style: SweetAlertStyle.error,
                          title: "Kayıt Başarısız",
                          subtitle: "Bu E-posta kullanımda veya şifre zayıf.");
                    }
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
