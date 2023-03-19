import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 24,
          ),
          TextButton.icon(
              onPressed: () async {
                String logoutResponse = await authController.signOut();
                if (logoutResponse == "success") {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                } else {
                  Scaffold.of(context).closeDrawer();
                  dialogsController.popUpSnackBar(
                      context, "Something went wrong. Please try again", false);
                }
              },
              icon: Icon(Icons.logout, color: Theme.of(context).primaryColor),
              label: Text(
                "Logout",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Theme.of(context).primaryColor),
              ))
        ]),
      ),
    );
  }
}
