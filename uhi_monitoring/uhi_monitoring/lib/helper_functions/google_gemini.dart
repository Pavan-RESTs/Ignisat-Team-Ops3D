import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static const String apiKey =
      'AIzaSyAuCDNpP8dsbQXpk9HFTBtvu2F_u14Czcw'; // Replace with your actual API key
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
  }

  Future<String?> generateContent(double m1, double m2, double m3, double m4,
      double m5, double m6, double m7) async {
    String prompt =
        "You are a urban heat island mitigation suggestion system. You need to provide suggestion "
        "based on the sensor data i give you as input. Based on the sensor data you need to provide the mitigation "
        "practices in 10 lines."
        "{lst_urban: $m1, lst_rural: $m2, humidity:$m3, co2: $m4, co: $m5, so2: $m6, nh3: $m7}."
        "Output format:"
        "{"
        "points to be displayed in correct format"
        "dont include stars and all"
        "leave a line between each line";
    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);

    if (response.candidates.isEmpty) {
      throw Exception('No response generated');
    }

    return response.text;
  }
}
