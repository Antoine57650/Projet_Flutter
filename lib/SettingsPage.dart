// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.settings),
          title: new Text("Settings"),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Center(
                  child: Text("Voici le block 1"),
                ),
              ),
            ),
            SizedBox(height: 100),
            Flexible(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      )),
                  child: Center(
                    child: Column(children: [
                      Text("Voici le block 2"),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),
                        onPressed: null,
                        child: Text('Test2'),
                      ),
                    ]),
                  ),
                ))
          ],
        ));
  }
}
