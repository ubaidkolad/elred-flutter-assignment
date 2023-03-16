import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
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
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.black87),
                        elevation: MaterialStateProperty.all(5),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 18)),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColorLight)),
                    onPressed: () {},
                    child: Text(
                      "ADD YOUR THING",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
      ),
    );
  }
}
