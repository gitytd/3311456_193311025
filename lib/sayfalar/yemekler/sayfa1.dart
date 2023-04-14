import 'package:edirne_rehberim/yazilar.dart';
import 'package:flutter/material.dart';

class Yemekler extends StatefulWidget {
  const Yemekler({Key? key}) : super(key: key);

  @override
  State<Yemekler> createState() => _YemeklerState();
}

class _YemeklerState extends State<Yemekler> {
  @override
  Yazilar yazilar = Yazilar();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Yemekler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(yazilar.yemek1),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/11.jpeg'),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yemek2),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/22.jpeg'),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yemek3),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/33.jpeg'),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yemek4),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/44.jpeg'),
              SizedBox(
                height: 20,
              ),
              Text(yazilar.yemek5),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/55.jpeg'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
