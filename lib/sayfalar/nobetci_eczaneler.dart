// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Eczane extends StatefulWidget {
  Eczane({super.key});

  @override
  State<Eczane> createState() => _EczaneState();
}

class _EczaneState extends State<Eczane> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Nobetci Eczaneler'),
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
                      Text('Eczane', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Telefon', style: TextStyle(fontSize: 20.0))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text(' KUTLUTAS ECZANESİ')]),
                    InkWell(
                      onTap: () {
                        launch("tel://02842350085");
                      },
                      child: Row(
                          children: [Icon(Icons.call), Text('02842350085')]),
                    )
                  ]),
                  TableRow(children: [
                    Column(children: [Text(' EZGİ ENGİN ECZANESİ')]),
                    InkWell(
                        onTap: () {
                          launch("tel://02842132547");
                        },
                        child: Row(
                            children: [Icon(Icons.call), Text('02842132547')])),
                  ]),
                  TableRow(children: [
                    Column(children: [Text(' MEHMET AY ECZANESİ')]),
                    InkWell(
                        onTap: () {
                          launch("tel://02842251503");
                        },
                        child: Row(
                            children: [Icon(Icons.call), Text('02842251503')])),
                  ]),
                ]),
          ),
        ],
      ),
    );
  }
}
