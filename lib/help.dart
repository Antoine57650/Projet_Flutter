import 'package:flutter/material.dart';

class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.white12,
          child: const Icon(Icons.backspace),
        ));
  }
}
