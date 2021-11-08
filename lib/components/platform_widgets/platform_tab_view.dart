
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class PlatformTabView extends PlatformWidget<CupertinoTabView, Widget> {
  final Widget child;

  const PlatformTabView({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget createAndroidWidget(BuildContext context) {
    return child;
  }

  @override
  CupertinoTabView createIosWidget(BuildContext context) {
    return CupertinoTabView(builder: (context) {
      return child;
    });
  }
}
