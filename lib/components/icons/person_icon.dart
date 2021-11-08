
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const PersonIcon({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.person, color: color, size: size),
      iconIos: Icon(CupertinoIcons.person_solid, color: color, size: size),
    );
  }
}
