import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobber/details.dart';
import 'package:jobber/splash.dart';
import 'home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Jobs Search',
      home: Splash(),
      routes: {'/home': (context) => Home(), '/detail': (context) => Details()},
    );
  }
}
