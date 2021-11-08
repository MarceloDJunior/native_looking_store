
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class PlatformTabBar
    extends PlatformWidget<CupertinoTabBar, BottomNavigationBar> {
  final List<BottomNavigationBarItem> items;
  final double? iconSize;
  final int currentIndex;
  final void Function(int)? onTap;

  const PlatformTabBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  BottomNavigationBar createAndroidWidget(BuildContext context) {
    return BottomNavigationBar(
      iconSize: iconSize ?? 23,
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  @override
  CupertinoTabBar createIosWidget(BuildContext context) {
    return CupertinoTabBar(
      iconSize: iconSize ?? 23,
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
