import 'package:flutter/material.dart';
import 'package:flutter_app/uiimageprocessing/customimage.dart';

class FirstFlatButton extends FlatButton {
  CustomImage image;

  FirstFlatButton (this.image);

  @override
  Widget build(BuildContext context) {
    return FlatButton
      (
        onPressed: () {
          Navigator.pushNamed(context, '/second', arguments: this.image);
        },
        child: image,
        padding: EdgeInsets.all(20));
  }

}