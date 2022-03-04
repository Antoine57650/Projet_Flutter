import 'package:flutter/material.dart';

class help2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Où sont engeristrées mes photos ?'),
      ),
      body: Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              'Les photos sont enregistrées dans le dossier DCIM de votre smartphone dans un album ="your album"',
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
