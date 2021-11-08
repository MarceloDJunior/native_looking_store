
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  final Color? color;
  const HomeIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.home, color: color),
      iconIos: Icon(CupertinoIcons.home, color: color),
    );
  }
}
