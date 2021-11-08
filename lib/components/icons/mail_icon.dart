
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MailIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const MailIcon({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.mail, color: color, size: size),
      iconIos: Icon(CupertinoIcons.mail_solid, color: color, size: size),
    );
  }
}
