import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_app/uiimageprocessing/makeuiimage.dart';
import 'package:flutter_app/uiimageprocessing/uiimagepainter.dart';

class ResultAlertDialog extends AlertDialog{
  Uint8List list;
  Size size;

  ResultAlertDialog (this.list, this.size);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black12,
      content: FutureBuilder(
          future: makeImage(list, size.width.toInt(), size.height.toInt()),
          builder: (context, snapshot) {
            if (snapshot.data!=null) {
              return  Container(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.contain,
                    child: CustomPaint(painter: UIImagePainter(snapshot.data), size: size,)
                ),
              );

            } else {
              return CircularProgressIndicator();
            }
          }),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}