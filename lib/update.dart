// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/help.dart';

class Update extends StatefulWidget {
  final name;
  Update({Key? key, required this.name});

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController test = new TextEditingController();
  TextEditingController test1 = new TextEditingController();
  TextEditingController test2 = new TextEditingController();
  TextEditingController test3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.home),
        title: new Text("Update Page"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => help()),
                  );
                },
                child: Icon(Icons.help),
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: test,
            decoration: InputDecoration(hintText: 'Titre'),
          ),
          TextField(
            controller: test1,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: test2,
            decoration: InputDecoration(hintText: 'Prix'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: test3,
            decoration: InputDecoration(hintText: 'Numéro de téléphone'),
            keyboardType: TextInputType.phone,
          ),
          Text('Name: ${widget.name}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FirebaseFirestore.instance
            .collection('testing')
            .doc('${widget.name}')
            .update({
          'titre': test.text.toString(),
          'Description': test1.text.toString(),
          'Prix': test2.text.toString(),
          'phone': test3.text.toString(),
          'Timestamp': DateTime.now().toString(),
        }),
        tooltip: 'Mettre en ligne',
        child: Icon(Icons.upgrade),
      ),
    );
  }
}
