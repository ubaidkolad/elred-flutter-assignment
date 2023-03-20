import 'package:elred_flutter_assignment/common_components/custom_button.dart';
import 'package:elred_flutter_assignment/common_components/custom_checkbox.dart';
import 'package:elred_flutter_assignment/common_components/custom_dropdown.dart';
import 'package:elred_flutter_assignment/common_components/custom_text_input.dart';
import 'package:elred_flutter_assignment/common_components/icon_with_circular_border.dart';
import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:elred_flutter_assignment/providers/TaskListProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskFormView extends StatefulWidget {
  final bool isEditing;
  final TaskDetails? taskDetails;
  const TaskFormView({Key? key, this.isEditing = false, this.taskDetails})
      : super(key: key);

  @override
  State<TaskFormView> createState() => _TaskFormView();
}

class _TaskFormView extends State<TaskFormView> {
  TextEditingController taskName = TextEditingController();
  TextEditingController taskPlace = TextEditingController();
  TextEditingController taskTime = TextEditingController();
  TextEditingController taskNotification = TextEditingController();
  String taskType = "Personal";
  bool isCompleted = false;
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if (widget.isEditing && widget.taskDetails != null) {
      taskType = widget.taskDetails!.taskType;
      taskPlace.text = widget.taskDetails!.taskPlace;
      taskName.text = widget.taskDetails!.taskName;
      taskTime.text = widget.taskDetails!.taskTime;
      taskNotification.text = widget.taskDetails!.taskNotification;
      isCompleted = widget.taskDetails!.completed;
    }
  }

  void addTask(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    String taskId = DateTime.now().millisecondsSinceEpoch.toString();
    var taskDetails = TaskDetails(
        taskType,
        taskName.text,
        taskPlace.text,
        taskTime.text,
        taskNotification.text,
        auth.currentUser!.uid,
        widget.taskDetails != null ? widget.taskDetails!.taskId : taskId,
        isCompleted);

    bool isSuccess = widget.isEditing
        ? await tasksController.updateTaskInDatabase(taskDetails)
        : await tasksController.addTaskToDatabase(taskDetails);
    setState(() {
      isLoading = false;
    });
    if (isSuccess) {
      Provider.of<TaskListProvider>(context, listen: false)
          .loadTaskListFromDatabase();
      Navigator.of(context).pop();
      dialogsController.popUpSnackBar(
          context,
          widget.isEditing
              ? "Task updated successfully"
              : "Task added successfully!",
          true);
    } else {
      dialogsController.popUpSnackBar(
          context,
          widget.isEditing
              ? "Failed to update task. Please try again"
              : "Failed to add task. Please try again",
          false);
    }
  }

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
          widget.isEditing ? "Edit your thing" : "Add new thing",
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
                  value: taskType,
                  hintText: "Select Task Type",
                  dropdownOptions: ["Personal", "Business"],
                  callback: ((selectedOption) {
                    taskType = selectedOption;
                    setState(() {});
                  }),
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
                    _showTimePicker();
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
                SizedBox(
                  height: 16,
                ),
                CustomCheckBox(
                  value: isCompleted,
                  text: "Mark as completed",
                  callback: (completed) {
                    isCompleted = completed;
                    setState(() {});
                  },
                ),
                Spacer(),
                CustomButton(
                    isLoading: isLoading,
                    text: widget.isEditing ? "SAVE CHANGES" : "ADD YOUR THING",
                    onPress: () {
                      if (_formkey.currentState!.validate()) {
                        addTask(context);
                      }
                    }),
                Spacer(),
              ]),
        ),
      ),
    );
  }

  void _showTimePicker() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      taskTime.text =
          "${picked.hourOfPeriod}:${picked.minute} ${picked.period.name}";
      setState(() {});
    }
  }
}
