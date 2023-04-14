import 'package:edirne_rehberim/sayfalar/gezilecek_yerler/sayfa1.dart';
import 'package:edirne_rehberim/sayfalar/iletisim.dart';
import 'package:edirne_rehberim/sayfalar/namaz_vakitleri.dart';
import 'package:edirne_rehberim/sayfalar/nobetci_eczaneler.dart';
import 'package:edirne_rehberim/sayfalar/saatkac.dart';
import 'package:edirne_rehberim/sayfalar/sehir_harita.dart';
import 'package:edirne_rehberim/sayfalar/tarihi.dart';
import 'package:edirne_rehberim/sayfalar/uzaklik.dart';
import 'package:edirne_rehberim/sayfalar/yemekler/sayfa1.dart';
import 'package:flutter/material.dart';

class Menuler extends StatefulWidget {
  Menuler({super.key});

  @override
  State<Menuler> createState() => _MenulerState();
}

class _MenulerState extends State<Menuler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Edirne Rehberim'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    const snackBar = SnackBar(
                      content: Text('Edirne Rehberim\'e Hos Geldiniz'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Image.asset(
                    "assets/manzara.jpg",
                    height: 150,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tarihi()),
                  );
                },
                child: Text(
                  "Edirne Tarihi",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sayfa1()),
                  );
                },
                child: Text(
                  "Gezilecek Yerler",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Yemekler()),
                  );
                },
                child: Text(
                  "Ünlü Yemekleri",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Harita()),
                  );
                },
                child: Text(
                  "Şehir Haritası",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Saat()),
                  );
                },
                child: Text(
                  "Edirnede Saat Kaç",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NamazVakitleri()),
                  );
                },
                child: Text(
                  "Edirne Namaz Vakitleri",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Iletisim()),
                  );
                },
                child: Text(
                  "İletişim Numaraları",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Eczane()),
                  );
                },
                child: Text(
                  "Nobetçi Eczaneler",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Uzaklik()),
                  );
                },
                child: Text(
                  "İlçelere Uzaklık",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
