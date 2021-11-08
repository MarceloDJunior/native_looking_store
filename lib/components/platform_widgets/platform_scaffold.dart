
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final Widget child;

  const PlatformScaffold({required this.child, Key? key}) : super(key: key);

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      child: child,
    );
  }
}
