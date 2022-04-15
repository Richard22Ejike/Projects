import 'package:flutter/material.dart';
import 'package:searchme/responsive/mobilelayout.dart';
import 'package:searchme/responsive/responsive.dart';
import 'package:searchme/responsive/weblayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Clone',
      home:  ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}

