import 'package:elred_flutter_assignment/common_components/custom_button.dart';
import 'package:elred_flutter_assignment/common_components/custom_dropdown.dart';
import 'package:elred_flutter_assignment/common_components/custom_text_input.dart';
import 'package:elred_flutter_assignment/common_components/icon_with_circular_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TextEditingController taskName = TextEditingController();
  TextEditingController taskPlace = TextEditingController();
  TextEditingController taskTime = TextEditingController();
  TextEditingController taskNotification = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Theme.of(context).primaryColorLight,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Add new thing",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconWithCircularBorder(
                  borderColor: Colors.grey[600]!,
                  radius: 32,
                  iconSize: 32,
                ),
                Spacer(),
                CustomDropdown(
                  hintText: "Select Task Type",
                  dropdownOptions: ["Personal", "Business"],
                ),
                CustomTextInput(
                  textEditingController: taskName,
                  placeholder: 'Name',
                  validator: ((val) {
                    if (val!.isEmpty) {
                      return 'Please enter name';
                    }
                  }),
                ),
                CustomTextInput(
                  textEditingController: taskPlace,
                  placeholder: 'Place',
                  validator: ((val) {
                    if (val!.isEmpty) {
                      return 'Please enter place';
                    }
                  }),
                ),
                CustomTextInput(
                  onTap: () {
                    _showDatePicker();
                  },
                  textEditingController: taskTime,
                  placeholder: 'Time',
                  validator: ((val) {
                    if (val!.isEmpty) {
                      return 'Please enter time';
                    }
                  }),
                ),
                CustomTextInput(
                  textEditingController: taskNotification,
                  placeholder: 'Notification',
                  validator: ((val) {
                    if (val!.isEmpty) {
                      return 'Please enter notification';
                    }
                  }),
                ),
                Spacer(),
                CustomButton(
                    text: "ADD YOUR THING",
                    onPress: () {
                      if (_formkey.currentState!.validate()) {
                        print('Validated');
                      }
                    }),
                Spacer()
              ]),
        ),
      ),
    );
  }

  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate = picked;
      print('Selected date ${picked.toLocal()}');
      taskTime!.text = DateFormat.yMMMMd().format(picked);
      setState(() {});
    }
  }
}
