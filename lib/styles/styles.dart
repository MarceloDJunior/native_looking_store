import 'dart:io';

import 'package:native_looking_store/styles/styles_android.dart';
import 'package:native_looking_store/styles/styles_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static getStyles() {
    if (Platform.isIOS) {
      return StylesIOS();
    } else {
      return StylesAndroid();
    }
  }

  static TextStyle productRowItemName = Styles.getStyles().productRowItemName;

  static TextStyle productRowTotal = Styles.getStyles().productRowTotal;

  static TextStyle productRowItemPrice = Styles.getStyles().productRowItemPrice;

  static TextStyle searchText = Styles.getStyles().searchText;

  static TextStyle deliveryTimeLabel = Styles.getStyles().deliveryTimeLabel;

  static TextStyle deliveryTime = Styles.getStyles().deliveryTime;

  static Color productRowDivider = Styles.getStyles().productRowDivider;

  static Color scaffoldBackground = Styles.getStyles().scaffoldBackground;

  static Color searchBackground = Styles.getStyles().searchBackground;

  static Color searchCursorColor = Styles.getStyles().searchCursorColor;

  static Color searchIconColor = Styles.getStyles().searchIconColor;

  static Color inputIconColor = Styles.getStyles().inputIconColor;

  static Color borderColor = Styles.getStyles().borderColor;

  static BoxDecoration searchBoxDecoration = Styles.getStyles().searchBoxDecoration;

  static EdgeInsetsGeometry searchBoxPadding = Styles.getStyles().searchBoxPadding;

  static EdgeInsetsGeometry searchTextPadding = Styles.getStyles().searchTextPadding;
}
