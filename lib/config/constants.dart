import 'package:elred_flutter_assignment/controllers/dialogs_controller.dart';
import 'package:elred_flutter_assignment/controllers/task_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:elred_flutter_assignment/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final auth = FirebaseAuth.instance;
final database = FirebaseFirestore.instance;
final authController = AuthController();
final dialogsController = DialogsController();
final tasksController = TaskController();

//collections
final usersCollection = database.collection('users');
