
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  final Color? color;
  const SearchIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.search, color: color),
      iconIos: Icon(CupertinoIcons.search, color: color),
    );
  }
}
