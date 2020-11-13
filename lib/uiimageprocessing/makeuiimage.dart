import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

// make ui Image from RGBAList

Future <ui.Image> makeImage(Uint8List rgbalist, int width, int height) {
  final c = Completer<ui.Image>();
  ui.decodeImageFromPixels(
    rgbalist.buffer.asUint8List(),
    width,
    height,
    ui.PixelFormat.rgba8888,
    c.complete,
  );
  return c.future;
}