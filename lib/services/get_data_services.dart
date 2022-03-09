import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheater_app/wheather_models.dart';

class DataServices {
  Future<WeatherResponse> getWheater(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    const baseUrl = 'api.openweathermap.org';
    const pathUrl = '/data/2.5/weather';

    const apiKey = 'your-api-key-here';

    final queryParameters = {'q': city, 'appid': apiKey, 'units': 'imperial'};

    final uri = Uri.https(baseUrl, pathUrl, queryParameters);

    final response = await http.get(uri);

    //print(response.body);

    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
}
