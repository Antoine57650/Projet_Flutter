// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _souvenir = false;

  void onChangeSouvenir(bool? checked) {
    // nécessaire pour faire évoluer l'interface
    setState(() {
      _souvenir = checked!;
    });
  }

  void onClicValider() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.login),
          title: new Text("Home Page"),
        ),
        body: new Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Utilisateur",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Utilisateur'),
              ),
            ),
            Text(
              "Mot de passe",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'MDP'),
              ),
            ),
            SizedBox(
              child: CheckboxListTile(
                title: const Text('Se souvenir de moi'),
                value: _souvenir,
                onChanged: onChangeSouvenir,
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  shadowColor: Colors.blue[900],
                ),
                onPressed: onClicValider,
                child: const Text('Valider'))
          ],
        )));
  }
}
