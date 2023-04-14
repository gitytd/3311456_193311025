import 'package:flutter/material.dart';

class NamazVakitleri extends StatefulWidget {
  NamazVakitleri({super.key});

  @override
  State<NamazVakitleri> createState() => _NamazVakitleriState();
}

class _NamazVakitleriState extends State<NamazVakitleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Namaz Vakitleri'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Table(
                defaultColumnWidth: FixedColumnWidth(180.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Vakitler', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Saat', style: TextStyle(fontSize: 20.0))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Imsak')]),
                    Column(children: [Text('05:17')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Gunes')]),
                    Column(children: [Text('06:46')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Öğle')]),
                    Column(children: [Text('13:22')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('İkindi')]),
                    Column(children: [Text('16:57')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Akşam')]),
                    Column(children: [Text('19:48')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Yatsı')]),
                    Column(children: [Text('21:12')]),
                  ]),
                ]),
          ),
        ],
      ),
    );
  }
}
