import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

// custom painter for ui Images

class UIImagePainter extends CustomPainter {
  final ui.Image image;
  UIImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(UIImagePainter oldDelegate) {
    return true;
  }
}