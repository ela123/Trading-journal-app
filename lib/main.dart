import 'package:flutter/material.dart';
import 'package:myapp/pages/welcome.dart';
//import 'package:myapp/pages/trade_pie_chart.dart';
//import 'package:myapp/pages/price.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Welcome());
  }
}
