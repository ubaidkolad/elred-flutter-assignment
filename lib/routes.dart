import 'package:elred_flutter_assignment/views/add_task/task_form_view.dart';
import 'package:elred_flutter_assignment/views/auth/login_view.dart';
import 'package:elred_flutter_assignment/views/home/home_view.dart';
import 'package:flutter/material.dart';

class Routerr {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeView());
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginView());
      case "/task_form_view":
        var args = settings.arguments as TaskFormView;
        return MaterialPageRoute(
            builder: (_) => TaskFormView(
                  isEditing: args.isEditing,
                  taskDetails: args.taskDetails,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
