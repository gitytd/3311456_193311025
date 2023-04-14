import 'package:edirne_rehberim/menuler.dart';
import 'package:flutter/material.dart';

class Hosgeldiniz extends StatefulWidget {
  Hosgeldiniz({super.key});

  @override
  State<Hosgeldiniz> createState() => _HosgeldinizState();
}

class _HosgeldinizState extends State<Hosgeldiniz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/edirne.png"),
            Text(
              "Edirne Sehir Rehberi Uygulamasına hoş geldiniz.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Uygulamamız ilimiz hakkında cebinizde bir yardımcı olması amacıyla tasarlandı.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Menuler()));
              },
              child: Text(
                "İleri",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
