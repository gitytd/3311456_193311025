import 'package:edirne_rehberim/yazilar.dart';
import 'package:flutter/material.dart';

class Sayfa1 extends StatefulWidget {
  const Sayfa1({Key? key}) : super(key: key);

  @override
  State<Sayfa1> createState() => _Sayfa1State();
}

class _Sayfa1State extends State<Sayfa1> {
  @override
  Yazilar yazilar = Yazilar();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Gezilecek Yerler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(yazilar.yer1),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yer2),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/1.jpg'),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yer3),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yer4),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yer5),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/2.jpg'),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yer6),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/3.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
