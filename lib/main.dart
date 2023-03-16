import 'package:elred_flutter_assignment/config/styles/theme.dart';
import 'package:elred_flutter_assignment/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elred Flutter Assignment',
      theme: themeData,
      home: const HomeView(),
    );
  }
}
