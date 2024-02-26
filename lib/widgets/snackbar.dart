import 'package:flutter/material.dart';

showReusableSnackBar(BuildContext context, String title) {
  SnackBar snackBar = SnackBar(
    backgroundColor: Colors.cyan,
    duration: const Duration(seconds: 5),
    content: Text(
      title.toString(),
      style: const TextStyle(
        fontSize: 36,
        color: Colors.white,
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

linearProgressBar() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 14),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
    ),
  );
}
