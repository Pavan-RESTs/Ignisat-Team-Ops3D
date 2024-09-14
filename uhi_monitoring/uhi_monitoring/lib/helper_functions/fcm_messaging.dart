import 'dart:convert';

import 'package:http/http.dart' as http;

class sendNotify {
  static Future<void> sendNotificationThroughCloudFunction(String functionUrl,
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

// Example usage
void main() {
  const functionUrl =
      'https://us-central1-general-firebase-affd9.cloudfunctions.net/sendNotification'; // Replace with your Cloud Function URL
  const registrationToken =
      "edfKMhUfTJ-zOa6hv4K4b9:APA91bE34mNBrCRvoHx4nox9Ny1hWnproaGXjDCR8Jrn_GxOXlUtJHpdar9TCA7kJoCtfJYkYmsr52bBWm84Dj0xj2oV3DsPa-v5gf5sJZC0VcXCPw8voToROJ_DIT6ZwYAF9PIWXed3"; // Replace with the target device's registration token
  const title = 'Hello';
  const body = 'This is a test notification.';

  sendNotify.sendNotificationThroughCloudFunction(
      functionUrl, registrationToken, title, body);
}
