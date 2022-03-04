// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_application_2/help.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.home),
          title: new Text("Home Page"),
        ),
        body: Center(
            child: BounceInDown(
                child: Text(
          "Bienvenue",
          style: TextStyle(fontSize: 38),
        ))));
  }
}
