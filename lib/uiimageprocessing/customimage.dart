import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// helper class to handle ui Images

class CustomImage extends StatelessWidget {
  Image image;
  ui.Image uiImage;
  int height;
  int width;
  String url;
  List RGBAList;

  CustomImage(this.url);

  Color getARGBColorAtPixel(int x, int y) {
    if (RGBAList != null) {
      int adoptedCoordinate = (y * width + x) * 4;
      int r = RGBAList[adoptedCoordinate];
      int g = RGBAList[adoptedCoordinate + 1];
      int b = RGBAList[adoptedCoordinate + 2];
      int a = RGBAList[adoptedCoordinate + 3];
      return Color.fromARGB(a, r, g, b);
    }
    else
      return null;
  }

  Future<Uint8List> getRGBAList() async {
    Uint8List RGBAList;
    ByteData bdata =
        await uiImage.toByteData(format: ui.ImageByteFormat.rawRgba);
    RGBAList = bdata.buffer.asUint8List();
    return RGBAList;
  }

  Future<ui.Image> getImage(String path) async {
    Completer<ImageInfo> completer = Completer();
    var img = new AssetImage(path);
    img
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    }));
    ImageInfo imageInfo = await completer.future;
    return imageInfo.image;
  }

  Future callAsyncFetch() async {
    image = Image.asset(url);
    await getImage(url).then((uiImg) => uiImage = uiImg);
    height = uiImage.height;
    width = uiImage.width;
    await getRGBAList().then((list) => RGBAList = list);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: callAsyncFetch(),
        builder: (context, snapshot) {
          if (uiImage!=null && RGBAList!=null) {
            return this.image;
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
