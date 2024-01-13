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
  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
        title: appName,
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
