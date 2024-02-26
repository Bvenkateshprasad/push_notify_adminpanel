import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth/Loginscreen.dart';
import '../global/global.dart';
import '../homescreen.dart';
import '../push/send_notify.dart';
import '../widgets/snackbar.dart';

class NotifyToSingleUser extends StatefulWidget {
  const NotifyToSingleUser({super.key});

  @override
  State<NotifyToSingleUser> createState() => _NotifyToSingleUserState();
}

class _NotifyToSingleUserState extends State<NotifyToSingleUser> {
  var title = "";
  var body = "";
  var imageUrl = "";
  var uid = "X61fG4qLaQOEFSoaGm6A13Lwc2B3";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify To All"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Title : $title '),
            Text('Body : $body '),
            Image.network(
              imageUrl,
              height: 50,
              width: 50,
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                  setState(() {});
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Body'),
                onChanged: (value) {
                  body = value;
                  setState(() {});
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Image Url'),
                onChanged: (value) {
                  imageUrl = value;
                  setState(() {});
                }),

            ElevatedButton(
                onPressed: () {
                  if (title != "" && body != "" && imageUrl != "") {
                    sendNotificationToSingleUser(
                        uid, title, body, imageUrl, context);
                  } else {
                    showReusableSnackBar(context, "Fill Full Content");
                  }
                },
                child: const Text("Send Notification")),
            //logout button
            ElevatedButton.icon(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                "Logout".toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(40),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
