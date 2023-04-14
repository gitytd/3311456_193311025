import 'package:flutter/material.dart';

class Uzaklik extends StatefulWidget {
  Uzaklik({super.key});

  @override
  State<Uzaklik> createState() => _UzaklikState();
}

class _UzaklikState extends State<Uzaklik> {
  @override
  String ilce = 'ENEZ';
  String uzaklik = '171 km';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Ilcelere Uzaklik'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: ilce,
              items: [
                'ENEZ',
                'HAVSA',
                'İPSALA',
                'KEŞAN',
                'LALAPAŞA',
                'MERİÇ',
                'SÜLOĞLU',
                'UZUNKÖPRÜ'
              ].map((String ilce) {
                return DropdownMenuItem(
                  value: ilce,
                  child: Text(ilce),
                );
              }).toList(),
              onChanged: (String? secilenilce) {
                if (secilenilce == "ENEZ") {
                  setState(() {
                    uzaklik = "171 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "HAVSA") {
                  setState(() {
                    uzaklik = "27 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "İPSALA") {
                  setState(() {
                    uzaklik = "122 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "KEŞAN") {
                  setState(() {
                    uzaklik = "112 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "LALAPAŞA") {
                  setState(() {
                    uzaklik = "24 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "MERİÇ") {
                  setState(() {
                    uzaklik = "87 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "SÜLOĞLU") {
                  setState(() {
                    uzaklik = "33 km";
                    ilce = secilenilce!;
                  });
                } else if (secilenilce == "UZUNKÖPRÜ") {
                  setState(() {
                    uzaklik = "64 km";
                    ilce = secilenilce!;
                  });
                }
              },
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Merkeze Uzaklik: ' + uzaklik,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
