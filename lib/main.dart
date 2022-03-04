// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/HomePage.dart';
import 'package:flutter_application_2/LogIn.dart';
import 'package:flutter_application_2/SettingsPage.dart';
import 'package:flutter_application_2/add.dart';
import 'package:flutter_application_2/feature.dart';
import 'package:flutter_application_2/galerie.dart';
import 'camera.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigationBar(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    Feature(),
    Add(),
    HomePage(),
    Camera(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: true,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.login,
                color: Colors.red,
              ),
              // ignore: deprecated_member_use
              title: new Text(
                "Feature",
                style: TextStyle(color: Colors.red),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.add,
                color: Colors.red,
              ),
              // ignore: deprecated_member_use
              title: new Text(
                "Ajouter",
                style: TextStyle(color: Colors.red),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ),
              // ignore: deprecated_member_use
              title: new Text(
                "Home",
                style: TextStyle(color: Colors.red),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.camera,
                color: Colors.red,
              ),
              // ignore: deprecated_member_use
              title: new Text(
                "Photo",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
          // backgroundColor: Colors.black54,
          fixedColor: Colors.black),
    );
  }
}
