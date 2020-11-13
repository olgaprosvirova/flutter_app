import 'dart:typed_data';
import 'dart:math';
import 'customimage.dart';
import 'package:flutter/foundation.dart';

//get resulting image (difference between two given custom images

Uint8List compareCustomImages(CustomImage img1, CustomImage img2) {
  Uint8List result = img1.RGBAList;
  if (!listEquals(img1.RGBAList, img2.RGBAList)) {
    int minListLenght = min(
      img1.RGBAList.length,
      img2.RGBAList.length,
    );

    for (int i = 0; i < minListLenght; i++) {
      // if value doesn't match
      if (img1.RGBAList[i] != img2.RGBAList[i]) {
        // if it's alpha
        if (i % 4 == 3) {
          result[i] = 1;
        } else
          result[i] = max(img1.RGBAList[i]+img2.RGBAList[i],255);
      }
    }
  } else {
    // if images match, return the given image
    result = img1.RGBAList;
  }

  return result;
}
