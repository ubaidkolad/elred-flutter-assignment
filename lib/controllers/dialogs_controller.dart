import 'package:flutter/material.dart';

class DialogsController {
  void popUpSnackBar(BuildContext context, String text,
      [bool isSuccess = true]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
