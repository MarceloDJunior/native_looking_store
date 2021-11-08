
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const ClockIcon({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.timer, color: color, size: size),
      iconIos: Icon(CupertinoIcons.clock, color: color, size: size),
    );
  }
}
