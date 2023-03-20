// ignore_for_file: prefr_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elred_flutter_assignment/models/task.dart';
import 'package:elred_flutter_assignment/providers/TaskListProvider.dart';
import 'package:elred_flutter_assignment/views/add_task/task_form_view.dart';
import 'package:elred_flutter_assignment/views/home/components/home_body.dart';
import 'package:elred_flutter_assignment/views/home/components/home_drawer.dart';
import 'package:elred_flutter_assignment/views/home/components/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: Theme.of(context).primaryColor),
        child: Consumer(
          builder: (context, TaskListProvider value, child) => value.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColorLight,
                  ),
                )
              : homeLayout(value.taskLists),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColorLight,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TaskFormView()));
          }),
    );
  }

  Widget homeLayout(List<TaskDetails> taskDetails) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        HomeHeader(
          taskDetails: taskDetails,
        ),
        boldSmallTitle("INBOX"),
        HomeBody(
          taskDetails: taskDetails,
        ),
        //  boldSmallTitle("COMPLETED"),
      ]),
    );
  }

  Widget boldSmallTitle(String title) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: 24,
        left: 32,
      ),
      sliver: SliverToBoxAdapter(
          child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      )),
    );
  }
}
