import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PredictionController extends GetxController {
  RxString prediction = '0.000000'.obs;
  Timer? _cooldownTimer;

  @override
  void onInit() {
    super.onInit();
    _startListeningToFirestore();
  }

  void _startListeningToFirestore() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final DocumentReference docRef =
        firestore.collection('sensorData').doc('latestData');

    docRef.snapshots().listen((DocumentSnapshot snapshot) async {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;

        if (_cooldownTimer?.isActive ?? false) {
          _cooldownTimer?.cancel();
        }

        _cooldownTimer = Timer(Duration(seconds: 2), () async {
          await _fetchPrediction(data);
        });
      }
    });
  }

  Future<void> _fetchPrediction(Map<String, dynamic> data) async {
    final double humidity = (data['Humidity'] as num).toDouble();
    final double co2 = (data['MQ135'] as num).toDouble();
    final double co = (data['MQ2'] as num).toDouble();
    final double nh3 = (data['MQ6'] as num).toDouble();
    final double sulfurDioxide = (data['MQ9'] as num).toDouble();
    final double temperature = (data['Temperature'] as num).toDouble();

    final Map<String, dynamic> requestData = {
      't1_urban': temperature,
      't1_rural': 20.0,
      'humidity': humidity,
      'co2': co2,
      'co': co,
      'nh3': nh3,
      'sulfur_dioxide': sulfurDioxide,
    };

    final String url =
        'https://0e0f-2409-40f2-3b-33c5-c91e-37d1-9fba-43af.ngrok-free.app/predict';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final String predictionResult = responseBody['uhi_index'].toString();
        prediction.value = predictionResult;

        print('Prediction ' + predictionResult);
      } else {
        print('Error' + 'Failed to get prediction');
      }
    } catch (e) {
      print('Error' + 'Error sending data to model: $e');
    }
  }
}
