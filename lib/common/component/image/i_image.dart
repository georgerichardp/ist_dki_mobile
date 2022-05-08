import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';

class IImage extends StatelessWidget {
  final dynamic image;
  final double? height, width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  ///widget Image ini sudah di bikin fleksibel untuk menampilkan image dari File, assets dan internet
  const IImage(
      {Key? key, required this.image, this.height, this.width, this.fit =BoxFit.cover, this.borderRadius= BorderRadius.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image is String) {
      var image = this.image as String;
      if (image.isNotEmpty) {
        if (image.startsWith("http")) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Image.network(
              image,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        }else if (image.startsWith("assets")) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(
              image,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        }
      }
    }
    if(image is File){
      return ClipRRect(
        borderRadius: borderRadius,
        child: Image.file(
          image,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }
    return Icon(Icons.image_not_supported_outlined,size: width,color: Palette.neutral40,);
  }
}
