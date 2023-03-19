import 'package:flutter/material.dart';

class DialogsController {
  void popUpSnackBar(BuildContext context, String text,
      [bool isSuccess = true]) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(text),
    ));
  }
}
