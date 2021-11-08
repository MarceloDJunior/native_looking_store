import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class PlatformTextField extends PlatformWidget<CupertinoTextField, Padding> {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? style;
  final Color? cursorColor;
  final InputDecoration? inputDecoration;
  final BoxDecoration? boxDecoration;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final OverlayVisibilityMode clearButtonMode;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final String? label;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool enabled;
  final void Function(String)? onChanged;

  const PlatformTextField({
    this.controller,
    this.focusNode,
    this.style,
    this.cursorColor,
    this.inputDecoration,
    this.boxDecoration,
    this.prefix,
    this.padding,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = true,
    this.label,
    this.placeholder,
    this.keyboardType,
    this.readOnly = false,
    this.enabled = true,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Padding createAndroidWidget(BuildContext context) {
    Widget _buildPrefix() {
      if (prefix != null) {
        return Padding(
          child: prefix!,
          padding: const EdgeInsets.only(right: 12),
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    InputDecoration? _buildInputDecoration() {
      if (inputDecoration != null) {
        if (label != null) {
          return inputDecoration!.copyWith(
            labelText: label,
            contentPadding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
            hintText: placeholder,
          );
        } else {
          return inputDecoration!.copyWith(hintText: placeholder);
        }
      } else {
        return InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
          hintText: placeholder,
        );
      }
    }

    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPrefix(),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              style: style,
              cursorColor: cursorColor,
              decoration: _buildInputDecoration(),
              textCapitalization: textCapitalization,
              autocorrect: autocorrect,
              onChanged: onChanged,
              keyboardType: keyboardType,
              readOnly: readOnly,
              enabled: enabled,
            ),
          ),
        ],
      ),
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      style: style,
      cursorColor: cursorColor,
      decoration: boxDecoration,
      prefix: prefix,
      padding: padding ?? const EdgeInsets.all(0),
      clearButtonMode: clearButtonMode,
      textCapitalization: textCapitalization,
      autocorrect: autocorrect,
      placeholder: label ?? placeholder,
      onChanged: onChanged,
      keyboardType: keyboardType,
      readOnly: readOnly,
      enabled: enabled,
    );
  }
}
