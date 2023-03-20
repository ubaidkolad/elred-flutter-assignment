import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> dropdownOptions;
  final void Function(String) callback;

  const CustomDropdown({
    required this.hintText,
    required this.dropdownOptions,
    required this.callback,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.dropdownOptions.isNotEmpty) {
      dropdownValue = widget.dropdownOptions[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        hint: Text(widget.hintText),
        isExpanded: true,
        items: widget.dropdownOptions.map((item) {
          return DropdownMenuItem<String>(
            child: Text(item),
            value: item,
          );
        }).toList(),
        value: dropdownValue,
        onChanged: (String? value) {
          dropdownValue = value!;
          setState(() {});
          widget.callback(value);
        });
  }
}
