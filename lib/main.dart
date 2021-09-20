import 'package:flutter/material.dart';
import './SliverappbarBasic.dart';
import './SliverappbarStatus.dart';
import './SliverappbarWithState.dart';
import './SliverappbarWithTabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliverappbar Demo',
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      // home: SliverappbarBasic(),
      // home: SliverappbarStatus(),
      // home: SliverappbarWithState(),
      home: SliverappbarWithTabbar(),
    );
  }
}
