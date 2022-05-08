import 'package:flutter/material.dart';

import '../../../core/palette/palette.dart';
class IIcon extends StatelessWidget {
  final dynamic icon;
  final Color? color;
  final double? size;

  ///widget Icon ini sudah di bikin fleksibel untuk menampilkan icon dari IconData, assets dan internet
  const IIcon({Key? key, this.color = Palette.neutral80, this.size, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(icon is String){
      var image = icon as String;
      if (image.startsWith("assets")) {
        return ImageIcon(AssetImage(image),color: color,size: size);
      }else if(image.startsWith("http")){
        return ImageIcon(NetworkImage(image),color: color,size: size);
      }
    }else if(icon is IconData){
      var iconData = icon as IconData;
      return Icon(iconData,size: size, color: color);
    }
    return Icon(Icons.image_not_supported_outlined,size: size,color: Palette.neutral40,);
  }
}
