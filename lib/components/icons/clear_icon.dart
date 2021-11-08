
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearIcon extends StatelessWidget {
  final Color? color;
  const ClearIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.clear, color: color),
      iconIos: Icon(CupertinoIcons.clear_thick_circled, color: color),
    );
  }
}
