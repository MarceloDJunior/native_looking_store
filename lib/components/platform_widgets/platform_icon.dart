import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PlatformIcon extends StatelessWidget {
  final Icon iconAndroid;
  final Icon iconIos;

  const PlatformIcon({
    Key? key,
    required this.iconAndroid,
    required this.iconIos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return iconAndroid;
    } else if (Platform.isIOS) {
      return iconIos;
    }
    // platform not supported returns an empty widget
    return Container();
  }
}
