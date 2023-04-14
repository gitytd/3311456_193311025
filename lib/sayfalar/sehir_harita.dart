import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Harita extends StatefulWidget {
  Harita({super.key});

  @override
  State<Harita> createState() => _HaritaState();
}

class _HaritaState extends State<Harita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Sehir Haritasi'),
      ),
      body: Container(
          child: PhotoView(
        imageProvider: AssetImage("assets/harita.jpg"),
      )),
    );
  }
}
