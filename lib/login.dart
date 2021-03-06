import 'package:f1track/main.dart';
import 'package:f1track/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:f1track/services/auth/auth_methods.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                "Giriş",
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
                  label: Text('Giriş Yap'),
                  icon: Icon(Icons.login),
                  onPressed: () async {
                    var basarili = await signIn(
                        emailController.text, sifreController.text);
                    if (basarili) {
                      seciliSayfa = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TumSayfalar()),
                      );
                      SweetAlert.show(context,
                          style: SweetAlertStyle.success,
                          title: "Giriş Başarılı",
                          subtitle: "Hoşgeldin " + emailController.text);
                    } else {
                      SweetAlert.show(context,
                          style: SweetAlertStyle.error,
                          title: "Giriş Başarısız",
                          subtitle: "E-Posta veya şifre hatalı.");
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: TextSpan(
                    text: 'Kayıt Ol',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        seciliSayfa = -2;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TumSayfalar()),
                        );
                      },
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF1801),
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
