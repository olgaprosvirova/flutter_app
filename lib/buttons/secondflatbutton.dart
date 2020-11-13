import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_app/dialogs/resultalertdialog.dart';
import 'package:flutter_app/uiimageprocessing/comparecustomimages.dart';
import 'package:flutter_app/uiimageprocessing/customimage.dart';

class SecondFlatButton extends FlatButton {
  CustomImage firstImage;
  CustomImage image;

  SecondFlatButton (this.firstImage, this.image);

  @override
  Widget build(BuildContext context) {
    return FlatButton
      (
        onPressed: () {
          CustomImage img1=this.firstImage;
          CustomImage img2=this.image;
          Uint8List list = compareCustomImages(img1, img2);
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return ResultAlertDialog(list, Size(min(
                  img1.width, img2.width).toDouble(),
                  min(img1.height, img2.height).toDouble()));
            },
          );
        },
        child: image,
        padding: EdgeInsets.all(20));
  }

}