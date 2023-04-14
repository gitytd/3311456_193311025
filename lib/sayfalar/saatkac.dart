import 'package:flutter/material.dart';

class Saat extends StatefulWidget {
  Saat({super.key});

  @override
  State<Saat> createState() => _SaatState();
}

class _SaatState extends State<Saat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Edirne Saat Kac'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              DateTime.now().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
