
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformButton extends PlatformWidget<CupertinoButton, MaterialButton> {
  final EdgeInsetsGeometry? padding;
  final void Function() onPressed;
  final Widget child;

  const PlatformButton({
    required this.child,
    required this.onPressed,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  MaterialButton createAndroidWidget(BuildContext context) {
    return MaterialButton(
      padding: padding,
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      child: child,
      onPressed: onPressed,
    );
  }
}
