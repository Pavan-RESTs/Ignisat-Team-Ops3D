import 'package:cloud_firestore/cloud_firestore.dart'; // Import Cloud Firestore package
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../helper_functions/google_gemini.dart';

class ParagraphPage extends StatefulWidget {
  @override
  State<ParagraphPage> createState() => _ParagraphPageState();
}

class _ParagraphPageState extends State<ParagraphPage> {
  String generatedContent =
      'This is an example of a beautifully styled paragraph in Flutter.';
  bool isLoading = false;

  // Method to call the API and update the content
  Future<void> fetchGeneratedContent() async {
    setState(() {
      isLoading = true;
    });

    final geminiService = GeminiService();

    try {
      // Fetch data from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('sensorData')
          .doc('latestData')
          .get();

      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;

        // Extract the necessary values
        double temperature = data['Temperature']?.toDouble() ?? 0.0;
        double humidity = data['Humidity']?.toDouble() ?? 0.0;
        double mq135 = data['MQ135']?.toDouble() ?? 0.0;
        double mq2 = data['MQ2']?.toDouble() ?? 0.0;
        double mq6 = data['MQ6']?.toDouble() ?? 0.0;
        double mq9 = data['MQ9']?.toDouble() ?? 0.0;

        // Pass data to the generateContent method
        String? result = await geminiService.generateContent(
            temperature, // temperature
            20, // co2 (Placeholder value, adjust as needed)
            humidity, // humidity
            mq135, // co (Placeholder value, adjust as needed)
            mq2, // so2 (Placeholder value, adjust as needed)
            mq6, // nh3 (Placeholder value, adjust as needed)
            mq9 // co (Placeholder value, adjust as needed)
            );

        if (result != null) {
          setState(() {
            generatedContent = result;
          });
        }
      } else {
        setState(() {
          generatedContent = 'No data available in Firestore.';
        });
      }
    } catch (e) {
      setState(() {
        generatedContent = 'Failed to generate content: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch content when the page loads
    fetchGeneratedContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 60),
        child: Center(
          child: isLoading
              ? SpinKitWave(
                  color: Colors.teal,
                ) // Show a loading indicator while fetching data
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Suggested measures',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        generatedContent,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5, // Line height for better readability
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
