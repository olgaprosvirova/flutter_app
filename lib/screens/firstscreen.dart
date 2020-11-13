import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buttons/firstflatbutton.dart';
import 'package:flutter_app/uiimageprocessing/customimage.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State {
  CustomImage img1 = new CustomImage('assets/pic1.png');
  CustomImage img2 = new CustomImage('assets/pic2.png');
  CustomImage img3 = new CustomImage('assets/pic3.png');
  CustomImage img4 = new CustomImage('assets/pic4.png');
  CustomImage img5 = new CustomImage('assets/pic5.png');
  CustomImage img6 = new CustomImage('assets/pic6.png');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose first image!'),
        ),
        body: Center(
          child: Column(children: [
            Wrap(children: [
              FirstFlatButton(img1),
              FirstFlatButton(img2),
              FirstFlatButton(img3),
              FirstFlatButton(img4),
              FirstFlatButton(img5),
              FirstFlatButton(img6),
            ]),
          ]),
        ));
  }
}
