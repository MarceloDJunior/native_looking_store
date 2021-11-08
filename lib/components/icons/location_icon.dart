
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const LocationIcon({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.location_on, color: color, size: size),
      iconIos: Icon(CupertinoIcons.location_solid, color: color, size: size),
    );
  }
}
