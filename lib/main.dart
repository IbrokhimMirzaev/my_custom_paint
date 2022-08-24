import 'package:flutter/material.dart';
import 'package:my_custom_paint/home_page.dart';
import 'package:my_custom_paint/my_curve.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCurve(),
    );
  }
}
