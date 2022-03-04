// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_application_2/image.dart';

class galerie extends StatefulWidget {
  @override
  _galerieState createState() => _galerieState();
}

class _galerieState extends State<galerie> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.photo_album_sharp),
        title: new Text("Gallerie"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 400,
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 2.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageList[index].thumnailUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                imageList.length,
                (index) =>
                    Indicator(isActive: _selectedIndex == index ? true : false),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool? isActive;
  const Indicator({
    Key? key,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive! ? 16.0 : 16.0,
      height: 16.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive! ? Colors.red : Colors.black),
    );
  }
}
