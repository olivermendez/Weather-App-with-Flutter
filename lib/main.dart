import 'package:flutter/material.dart';
import 'package:wheater_app/services/get_data_services.dart';
import 'package:wheater_app/wheather_models.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataServices = DataServices();

  final _cityTextController = TextEditingController();

  WeatherResponse? _response;

  //MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wheather App'),
        ),
        body: Column(
          children: [
            Center(
              child: TextField(
                controller: _cityTextController,
                decoration: const InputDecoration(labelText: 'City'),
                textAlign: TextAlign.center,
                autocorrect: false,
              ),
            ),
            ElevatedButton(onPressed: _search, child: const Text('Search')),
            const Divider(
              height: 100,
            ),
            if (_response != null)
              Text(
                '${_response?.cityName}',
              ),
            Text(
              '${_response?.tempInfo?.temperature} °C',
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              '${_response?.weather?.description}',
            ),
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataServices.getWheater(_cityTextController.text);
    setState(() => _response = response);
  }
}
