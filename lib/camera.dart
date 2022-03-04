// ignore_for_file: prefer_const_constructors, unnecessary_new, non_constant_identifier_names

import 'dart:async';
import "dart:io";
import 'dart:typed_data';
import 'package:album_saver/album_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/help2.dart';
import 'package:dio/dio.dart';
import 'package:animate_do/animate_do.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? _image;

  final imagePicker = ImagePicker();
  // final url = 'https://i.stack.imgur.com/t5LYa.jpg';
  final String url = '';

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    AlbumSaver.saveToAlbum(filePath: image?.path, albumName: "YourAlbumName");
    AlbumSaver.createAlbum(albumName: "YourAlbumName");
    AlbumSaver.getDcimPath();

    setState(() {
      _image = File(image!.path);
    });
  }

  // final time = DateTime.now();
  // _save() async {
  //   var status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     var response = await Dio()
  //         .get(url, options: Options(responseType: ResponseType.bytes));
  //     final result = await ImageGallerySaver.saveImage(
  //         Uint8List.fromList(response.data),
  //         quality: 60,
  //         name: "hello_$time");
  //     print(result);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.camera),
          title: new Text("Camera"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => help2()),
                      );
                    },
                    child: ZoomIn(
                      child: ElasticIn(
                          duration: Duration(seconds: 5),
                          child: Icon(Icons.help)),
                    ))),
          ],
        ),
        body: Center(
          // ignore: unnecessary_null_comparison
          child:
              _image == null ? Text("No Image Selected") : Image.file(_image!),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: getImage,
              tooltip: 'Prendre une photo',
              child: Icon(Icons.camera),
            ),
          ],
        ));
  }
}
