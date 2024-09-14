const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors")({ origin: true });

admin.initializeApp();

exports.sendNotification = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    if (req.method !== "POST") {
      return res.status(405).send("Method Not Allowed");
    }

    // Extract the payload from the request body
    const { registrationToken, title, body } = req.body;

    // Your notification sending logic here
    // For example, using Firebase Admin SDK to send notifications
    const message = {
      notification: {
        title: title,
        body: body,
      },
      token: registrationToken,
    };

    admin.messaging().send(message)
      .then((response) => {
        console.log("Successfully sent message:", response);
        res.status(200).send("Notification sent");
      })
      .catch((error) => {
        console.error("Error sending message:", error);
        res.status(500).send("Error sending notification");
      });
  });
});
