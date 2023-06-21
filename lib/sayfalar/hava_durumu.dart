import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class HavaDurumu extends StatefulWidget {
  HavaDurumu({super.key});

  @override
  State<HavaDurumu> createState() => _HavaDurumuState();
}

class _HavaDurumuState extends State<HavaDurumu> {

  List<dynamic> forecastData = [];

  @override
  void initState() {
    super.initState();
    havadurumugetir();
  }

  Future<void> havadurumugetir() async {

    final apiUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=edirne&appid=6164196d2a2bbe6aeace0c4a7a38c678&units=metric';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        forecastData = data['list'];
      });
    } else {
      throw Exception('hata');
    }
  }

  @override
  Widget build(BuildContext context) {

    final List<charts.Series<ForecastTemperature, DateTime>> seriesList = [
      charts.Series<ForecastTemperature, DateTime>(
        id: 'Sicaklik',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (ForecastTemperature temperature, _) => temperature.date,
        measureFn: (ForecastTemperature temperature, _) => temperature.value,
        data: forecastData.map((item) {
          final date = DateTime.fromMillisecondsSinceEpoch(item['dt']);
          final temperature = item['main']['temp'].toDouble();
          return ForecastTemperature(date: date, value: temperature);
        }).toList(),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [

          SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: charts.TimeSeriesChart(
              seriesList,
              animate: true,

              primaryMeasureAxis: charts.NumericAxisSpec(
                tickProviderSpec: charts.BasicNumericTickProviderSpec(
                  desiredTickCount: 5,
                ),
              ),
            ),
          ),


          SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: ListView.builder(
              itemCount: forecastData.length,
              itemBuilder: (context, index) {
                final item = forecastData[index];
                final temperature = item['main']['temp'];
                final weatherDescription = item['dt_txt'];

                return ListTile(
                  title: Text('Sicaklik: ${temperature.toStringAsFixed(1)}°C'),
                  subtitle: Text('Tarih: $weatherDescription'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastTemperature {
  final DateTime date;
  final double value;

  ForecastTemperature({required this.date, required this.value});
}