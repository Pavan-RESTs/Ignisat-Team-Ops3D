import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class API {
  static Future<Map<String, String>> getCurrentConditions(
      String apiKey, double latitude, double longitude) async {
    final String url =
        'https://airquality.googleapis.com/v1/currentConditions:lookup?key=$apiKey';
    final Map<String, dynamic> payload = {
      "location": {"latitude": latitude, "longitude": longitude},
      "universalAqi": true,
      "extraComputations": [
        "HEALTH_RECOMMENDATIONS",
        "DOMINANT_POLLUTANT_CONCENTRATION",
        "POLLUTANT_CONCENTRATION",
        "LOCAL_AQI",
        "POLLUTANT_ADDITIONAL_INFO"
      ],
      "languageCode": "en"
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        // Extracting the required information
        final Map<String, String> result = {};

        // Example static values for temperature and humidity
        result['Temperature'] = "10 °C"; // Static value for demonstration
        result['Humidity'] = "10 %"; // Static value for demonstration

        // Extract Universal AQI
        final universalAqi = (data['indexes'] as List<dynamic>?)?.firstWhere(
          (index) => index['code'] == 'uaqi',
          orElse: () => null,
        );
        if (universalAqi != null) {
          result['Universal AQI'] =
              "${universalAqi['aqi']} (${universalAqi['category']})";
        }

        // Extract NAQI
        final naqi = (data['indexes'] as List<dynamic>?)?.firstWhere(
          (index) => index['code'] == 'ind_cpcb',
          orElse: () => null,
        );
        if (naqi != null) {
          result['NAQI'] = "${naqi['aqi']} (${naqi['category']})";
        }

        // Extract pollutants data
        for (var pollutant in (data['pollutants'] as List<dynamic>)) {
          final concentration = pollutant['concentration']?['value'] ?? 0;
          final unit = pollutant['concentration']?['units'] ?? '';

          switch (pollutant['code']) {
            case 'co':
              result['Carbon Monoxide'] = "$concentration ppb";
              break;
            case 'no2':
              result['Nitrogen Dioxide'] = "$concentration ppb";
              break;
            case 'o3':
              result['Ozone'] = "$concentration ppb";
              break;
            case 'nh3':
              result['Ammonia'] = "$concentration ppb";
              break;
            case 'pm10':
              result['PM10'] = "$concentration mpcm";
              break;
            case 'pm25':
              result['PM2.5'] = "$concentration mpcm";
              break;
            default:
              break;
          }
        }

        return result;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      return {};
    }
  }
}
