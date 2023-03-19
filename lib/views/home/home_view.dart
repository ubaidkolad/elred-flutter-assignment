// ignore_for_file: prefr_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elred_flutter_assignment/views/add_task/task_form_view.dart';
import 'package:elred_flutter_assignment/views/home/components/home_body.dart';
import 'package:elred_flutter_assignment/views/home/components/home_drawer.dart';
import 'package:elred_flutter_assignment/views/home/components/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        child: SafeArea(
          child: CustomScrollView(slivers: [
            HomeHeader(),
            boldSmallTitle("INBOX"),
            HomeBody(),
            boldSmallTitle("COMPLETED (5)"),
          ]),
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
