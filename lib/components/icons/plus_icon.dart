
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlusIcon extends StatelessWidget {
  final Color? color;
  const PlusIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.add, color: color),
      iconIos: Icon(CupertinoIcons.plus_circled, color: color),
    );
  }
}
