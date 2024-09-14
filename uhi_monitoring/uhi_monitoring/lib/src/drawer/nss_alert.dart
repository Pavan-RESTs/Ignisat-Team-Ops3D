import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helper_functions/snackBar.dart';

class NssAlert extends StatefulWidget {
  const NssAlert({super.key});

  @override
  State<NssAlert> createState() => _NssAlertState();
}

class _NssAlertState extends State<NssAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Icon(
                    Icons.send_time_extension_rounded,
                    color: Colors.teal.shade200,
                    size: 200,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "NSS Krishna Nagar",
                    style: TextStyle(color: Colors.teal.shade200, fontSize: 30),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade200),
                      onPressed: () async {
                        await sendNotificationThroughCloudFunction(
                          'https://us-central1-general-firebase-affd9.cloudfunctions.net/sendNotification',
                          'edfKMhUfTJ-zOa6hv4K4b9:APA91bE34mNBrCRvoHx4nox9Ny1hWnproaGXjDCR8Jrn_GxOXlUtJHpdar9TCA7kJoCtfJYkYmsr52bBWm84Dj0xj2oV3DsPa-v5gf5sJZC0VcXCPw8voToROJ_DIT6ZwYAF9PIWXed3',
                          'Krishna Nagar',
                          'Help combat urban heat islands by adopting green spaces and reducing energy use in your community',
                        );
                        Snack.display(
                            "Notification has been sent successfully to Krishna Nagar NSS");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      ))
                ],
              ),
              SizedBox(
                width: 250,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Icon(
                    Icons.send_time_extension_rounded,
                    color: Colors.teal.shade200,
                    size: 200,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "NSS Lawspet",
                    style: TextStyle(color: Colors.teal.shade200, fontSize: 30),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade200),
                      onPressed: () {
                        sendNotificationThroughCloudFunction(
                          'https://us-central1-general-firebase-affd9.cloudfunctions.net/sendNotification',
                          'e8IHbNc5TJaPKS4e-y2vgj:APA91bHCKiw4QYdyDvKQx_ED3KNtjYKuOvL_ufqgWgR5T4COs6sT_hYTKKJajsn0P1OQLeSgrNcNml9rMCIZF7wQgmxlEcX-rYTx_NrRCSW6Wr4LxBoJz0dCZJ_OgtUauooduHN2P3pE',
                          'Lawspet NSS',
                          'Join us in the mitigation of urban heat islands by supporting green initiatives and energy-efficient practices',
                        );
                        Snack.display(
                            "Notification has been sent successfully to Lawspet NSS");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendNotificationThroughCloudFunction(String functionUrl,
      String registrationToken, String title, String body) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final payload = {
      'registrationToken': registrationToken,
      'title': title,
      'body': body,
    };

    try {
      final response = await http.post(
        Uri.parse(functionUrl),
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully');
        print('Response body: ${response.body}');
      } else {
        print('Failed to send notification');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
