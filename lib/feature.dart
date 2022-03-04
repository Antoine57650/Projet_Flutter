// ignore_for_file: prefer_const_constructors, unnecessary_new, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/update.dart';
import 'package:url_launcher/url_launcher.dart';

class Feature extends StatefulWidget {
  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  var list = new List<int>.generate(10, (i) => i + 1).toString();
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('error');
    }
  }

  final String test1 = "id";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.login),
        title: new Text("Feature"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('testing').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }

            // ignore: unnecessary_new
            return new ListView(
                children: snapshot.data!.docs.map((data) {
              return ListTile(
                  title: Column(
                children: <Widget>[
                  Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(data['image']),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data['titre'] ?? 'Aucunes annonces',
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(data['Description'] ?? 'Aucunes annonces',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.white)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onPressed: () => FirebaseFirestore.instance
                                    .collection('testing')
                                    .doc(data.id)
                                    .delete(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Update(
                                        name: snapshot.data!.docs[0].id,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.mode_edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                data['Prix'] + ' €',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Row(
                    children: [
                      RaisedButton(
                        onPressed: () {
                          customLaunch('tel:' + data['phone']);
                        },
                        child: const Text('phone'),
                      ),
                      Text(data['Timestamp']),
                    ],
                  ),
                ],
              ));
            }).toList());
          }),
    );
  }
}
