import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper_functions/uhi_prediction.dart';

class SatelliteData extends StatefulWidget {
  const SatelliteData({super.key});

  @override
  State<SatelliteData> createState() => _SatelliteDataState();
}

class _SatelliteDataState extends State<SatelliteData> {
  String UhiIntensity(String val) {
    // Use tryParse to handle non-numeric strings safely
    double? num = double.tryParse(val);
    if (num == null) {
      return "Invalid data";
    } else if (num <= 0.3) {
      return "Low";
    } else if (num > 0.3 && num <= 0.6) {
      return "Moderate";
    } else {
      return "High";
    }
  }

  @override
  Widget build(BuildContext context) {
    final predictionController = Get.put(PredictionController());
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Images/sample.jpg"),
                fit: BoxFit.fill)),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: Colors.teal)),
            width: 350,
            height: 450,
            padding: EdgeInsets.all(16.0),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('sensorData')
                  .doc('latestData')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(child: Text('No data available!'));
                } else {
                  var data = snapshot.data!.data() as Map<String, dynamic>;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "   Satellite Live Data",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildDataRow("Temperature", data['Temperature']),
                      _buildDataRow("Humidity", data['Humidity']),
                      _buildDataRow("Methane", data['MQ2']),
                      _buildDataRow("Sulpher Dioxide", data['MQ6']),
                      _buildDataRow("Carbon Monoxide", data['MQ9']),
                      _buildDataRow("Ammonia", data['MQ135']),
                      Obx(
                        () => predictionController.prediction.isEmpty
                            ? Text("")
                            : _buildDataRow(
                                "UHI Index ",
                                predictionController.prediction
                                    .substring(0, 4)),
                      ),
                      Obx(
                        () => predictionController.prediction.isEmpty
                            ? Text("")
                            : _buildDataRow(
                                "UHI Intensity ",
                                UhiIntensity(predictionController.prediction
                                    .substring(0, 4))),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            value != null ? value.toString() : 'N/A',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
