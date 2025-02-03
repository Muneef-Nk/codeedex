import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSnackBar(BuildContext context, String message,
    {Color? backgroundColor}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor ?? Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: EdgeInsets.all(10),
      content: Text(
        message,
        style: TextStyle(fontSize: 12),
      ),
    ),
  );
}

saveAccessToken(String accessToken) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('accessToken', accessToken);
}

getAccessToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}
