import 'package:facemash/widgets/about.dart';
import 'package:facemash/widgets/graph1.dart';
import 'package:facemash/widgets/homepage.dart';
import 'package:facemash/widgets/howtoplay.dart';
import 'package:facemash/widgets/rankings.dart';
import 'package:flutter/material.dart';

final routes = {
  '/home': (BuildContext context) => new Home(),
  '/ranking': (BuildContext context) => new Ranking(),
  '/about': (BuildContext context) => new About(),
  '/howtoplay': (BuildContext context) => new HowtoPlay(),
  '/graph': (BuildContext context) => new Graph1(),
};
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Home(),
    routes: routes,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
