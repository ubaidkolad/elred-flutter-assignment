// ignore_for_file: prefr_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:elred_flutter_assignment/views/home/components/home_body.dart';
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: Theme.of(context).primaryColorLight),
        child: SafeArea(
          child: CustomScrollView(slivers: [HomeHeader(), HomeBody()]),
        ),
      ),
    );
  }
}
