import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Saat extends StatefulWidget {
  Saat({super.key});

  @override
  State<Saat> createState() => _SaatState();
}

class _SaatState extends State<Saat> {
  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hms().format(now);

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
              formattedTime,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
