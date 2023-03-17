import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextInput extends StatefulWidget {
  final String placeholder;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const CustomTextInput(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.placeholder,
      required this.textEditingController,
      this.validator,
      this.onTap})
      : super(key: key);

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool toggleSuffixIcon = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      validator: widget.validator,
      onChanged: ((value) {
        if (value.isEmpty) {
          toggleSuffixIcon = false;
        } else {
          toggleSuffixIcon = true;
        }
        setState(() {});
      }),
      controller: widget.textEditingController,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColorLight)),
          errorStyle: TextStyle(color: Theme.of(context).primaryColorLight),
          hintText: widget.placeholder,
          suffixIcon: widget.textEditingController.value.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    widget.textEditingController.clear();
                  },
                )
              : SizedBox()),
    );
  }
}
