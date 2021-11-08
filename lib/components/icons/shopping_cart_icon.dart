
import 'package:native_looking_store/components/platform_widgets/platform_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartIcon extends StatelessWidget {
  final Color? color;
  const ShoppingCartIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIcon(
      iconAndroid: Icon(Icons.shopping_cart, color: color),
      iconIos: Icon(CupertinoIcons.shopping_cart, color: color),
    );
  }
}
