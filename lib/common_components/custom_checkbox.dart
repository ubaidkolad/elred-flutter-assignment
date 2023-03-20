import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomCheckBox extends StatefulWidget {
  final String text;
  final bool value;
  final void Function(bool) callback;
  const CustomCheckBox(
      {Key? key,
      required this.text,
      required this.callback,
      required this.value})
      : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor:
                MaterialStateProperty.all(Theme.of(context).primaryColorLight),
            value: isChecked,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  isChecked = value;
                });
                widget.callback(value);
              }
            },
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          widget.text,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}
