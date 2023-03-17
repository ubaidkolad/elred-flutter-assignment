import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  const CustomButton({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.black87),
              elevation: MaterialStateProperty.all(5),
              padding:
                  MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 18)),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColorLight)),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
