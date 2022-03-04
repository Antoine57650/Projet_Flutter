// ignore_for_file: prefer_const_constructors, unnecessary_new

import "dart:io";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/help.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

String url = "";
File? _image;

final time = DateTime.now();
final imagePicker = ImagePicker();

class _AddState extends State<Add> {
  Future pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  TextEditingController test = new TextEditingController();
  TextEditingController test1 = new TextEditingController();
  TextEditingController test2 = new TextEditingController();
  TextEditingController test3 = new TextEditingController();

  uploadFile() async {
    var imageFile =
        FirebaseStorage.instance.ref().child('path').child('myimage_$time.jpg');
    UploadTask task = imageFile.putFile(_image!);
    TaskSnapshot snapshots = await task;

    url = await snapshots.ref.getDownloadURL();
    print(url);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.add_shopping_cart),
        title: new Text("Ajouter un produit"),
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
          FloatingActionButton(
            onPressed: () {
              uploadFile();
            },
            child: Icon(Icons.save),
          ),
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
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () => pickImage(),
              child: _image == null
                  ? Text("Ajouter une image du produit")
                  : Image.file(_image!),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FirebaseFirestore.instance.collection('testing').add({
          'titre': test.text.toString(),
          'Description': test1.text.toString(),
          'Prix': test2.text.toString(),
          'phone': test3.text.toString(),
          'Timestamp': DateTime.now().toString(),
          'image': url,
        }),
        tooltip: 'Mettre en ligne',
        child: Icon(Icons.send),
      ),
    );
  }
}
