import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;

import 'package:notify_admin_panel/widgets/snackbar.dart';

import '../global/global.dart';

void sendNotificationToUser(title, body, imageUrl, context) async {
  String userDeviceToken = "";
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      // .where("userDeviceToken", isNull: true)
      .get();
  snapshot.docs.forEach((DocumentSnapshot doc) async {
    userDeviceToken = doc["userDeviceToken"];
    await notificationFormat(userDeviceToken, title, body, imageUrl);
  });
  showReusableSnackBar(context, "Sent Notification Sucessfully");
}

notificationFormat(userDeviceToken, title, body, imageUrl) {
  Map<String, String> headerNotification = {
    'Content-Type': 'application/json',
    'Authorization': fcmServerToken,
  };
  Map bodyNotification = {
    'body': body,
    'title': title,
    'image': imageUrl,
  };
  Map dataMap = {
    "Message": "Working data here",
    "type": "chat",
    "name": "Venky God",
    "phone": "8985592263"
  };
  Map officialNotificationFormat = {
    'notification': bodyNotification,
    'data': dataMap,
    'priority': 'high',
    'to': userDeviceToken,
  };
  http.post(
    Uri.parse("https://fcm.googleapis.com/fcm/send"),
    headers: headerNotification,
    body: jsonEncode(officialNotificationFormat),
  );
}

void sendNotificationToSingleUser(uid, title, body, imageUrl, context) async {
  String userDeviceToken = "";
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where("uid", isEqualTo: uid.toString())
      .get();
  snapshot.docs.forEach((DocumentSnapshot doc) async {
    userDeviceToken = doc["userDeviceToken"];
    await notificationFormat(userDeviceToken, title, body, imageUrl);
  });
  showReusableSnackBar(context, "Sent Notification Sucessfully");
}
