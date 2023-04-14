// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Iletisim extends StatefulWidget {
  Iletisim({super.key});

  @override
  State<Iletisim> createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Iletisim Numaralari'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                launch("tel://02842139140");
              },
              child: Text("Belediye"),
            ),
            MaterialButton(
              onPressed: () {
                launch("tel://02842139184");
              },
              child: Text("Valilik"),
            ),
            MaterialButton(
              onPressed: () {
                launch("tel://0284 235 26 89");
              },
              child: Text("Tarim Orman Müdürlüğü"),
            ),
            MaterialButton(
              onPressed: () {
                launch("tel://2842126122");
              },
              child: Text("Il Milli Eğitim"),
            ),
            MaterialButton(
              onPressed: () {
                launch("tel://02842122589");
              },
              child: Text("Aile ve Sosyal Hizmetler"),
            ),
          ],
        ),
      ),
    );
  }
}
