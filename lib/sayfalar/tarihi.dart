import 'package:edirne_rehberim/yazilar.dart';
import 'package:flutter/material.dart';

class Tarihi extends StatefulWidget {
  Tarihi({super.key});

  @override
  State<Tarihi> createState() => _TarihiState();
}

class _TarihiState extends State<Tarihi> {
  Yazilar yazilar = Yazilar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('Edirne Tarihi'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/edirne.jpg",
                    height: 150,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(yazilar.tarihi)
                ],
              ),
            ),
          ),
        ));
  }
}
