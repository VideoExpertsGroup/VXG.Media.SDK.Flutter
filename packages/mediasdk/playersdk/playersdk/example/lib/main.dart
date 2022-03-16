import 'package:flutter/material.dart';
import 'player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    PlayerView player = new PlayerView();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: player,
      ),
    );
  }
}
