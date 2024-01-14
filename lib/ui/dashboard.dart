import 'dart:async';

import 'package:bill/common/app_assets.dart';
import 'package:bill/theme/elements_screen.dart';
import 'package:bill/ui/components/custom_drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      key.currentState?.openDrawer();
    });
  }
  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
        title: appName,
        key: key,
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
