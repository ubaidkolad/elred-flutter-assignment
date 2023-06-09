import 'dart:developer';

import 'package:elred_flutter_assignment/common_components/custom_button.dart';
import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/providers/TaskListProvider.dart';
import 'package:elred_flutter_assignment/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "elRed Task Manager",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "by\nUbaid Kolad",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 24,
                ),
                loading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColorLight,
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(12)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () async {
                              loading = true;
                              setState(() {});
                              bool loginResponse =
                                  await authController.signInWithGoogle();
                              loading = false;
                              setState(() {});
                              if (loginResponse) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()),
                                    (Route<dynamic> route) => false);
                                Provider.of<TaskListProvider>(context,
                                        listen: false)
                                    .loadTaskListFromDatabase();
                              } else {
                                dialogsController.popUpSnackBar(context,
                                    "Failed to login. Please try again", false);
                              }
                            },
                            icon: Image.asset(
                              "assets/images/google_icon.png",
                              scale: 24,
                            ),
                            label: Text(
                              ' Sign in with Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold),
                            )),
                      )
              ]),
        ),
      ),
    );
  }
}
