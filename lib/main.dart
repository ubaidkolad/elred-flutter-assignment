import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/config/styles/theme.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:elred_flutter_assignment/providers/TaskListProvider.dart';
import 'package:elred_flutter_assignment/routes.dart';
import 'package:elred_flutter_assignment/views/auth/login_view.dart';
import 'package:elred_flutter_assignment/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TaskListProvider(),
            lazy: false,
          )
        ],
        child: MaterialApp(
          onGenerateRoute: Routerr.generateRouter,
          title: 'Elred Flutter Assignment',
          theme: themeData,
          home: auth.currentUser == null ? LoginView() : HomeView(),
        ));
  }
}
