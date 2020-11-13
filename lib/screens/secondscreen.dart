import 'package:flutter/material.dart';
import 'package:flutter_app/buttons/secondflatbutton.dart';
import 'package:flutter_app/uiimageprocessing/customimage.dart';

class SecondScreen extends StatefulWidget {


  @override
  _SecondScreenState createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State {
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
    CustomImage firstImage = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose second image!'),
      ),
      body: Center(
          child: Column(children: [
            Wrap(children: [
              SecondFlatButton (firstImage, img1),
              SecondFlatButton (firstImage, img2),
              SecondFlatButton (firstImage, img3),
              SecondFlatButton (firstImage, img4),
              SecondFlatButton (firstImage, img5),
              SecondFlatButton (firstImage, img6),
            ]),
          ])
      ),
    );
  }
}