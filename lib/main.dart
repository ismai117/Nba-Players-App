import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature 1/players/players.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NBA Players",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.grey[900],
          backgroundColor: Colors.grey[900],
          textTheme: const TextTheme(
              bodyText2: TextStyle(fontSize: 18.0, color: Colors.black))),
      home: PlayersScreen()
    );
  }
}
