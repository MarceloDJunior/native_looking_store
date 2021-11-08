import 'package:native_looking_store/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StylesAndroid implements Styles {
  TextStyle productRowItemName = const TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  TextStyle productRowTotal = const TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  TextStyle productRowItemPrice = const TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  TextStyle searchText = const TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  TextStyle deliveryTimeLabel = const TextStyle(
    color: Color(0xFFC2C2C2),
    fontWeight: FontWeight.w300,
  );

  TextStyle deliveryTime = const TextStyle(
    color: CupertinoColors.inactiveGray,
  );

  Color productRowDivider = const Color(0xFFD9D9D9);

  Color scaffoldBackground = const Color(0xfff0f0f0);

  Color searchBackground = Colors.grey.shade100;

  Color searchCursorColor = const Color.fromRGBO(0, 122, 255, 1);

  Color searchIconColor = const Color.fromRGBO(128, 128, 128, 1);

  Color inputIconColor = Colors.grey.shade400;

  Color borderColor = Colors.grey.shade500;

  BoxDecoration searchBoxDecoration = BoxDecoration(
    color: Colors.grey.shade100,
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Colors.black26,
        blurRadius: 2.0,
        spreadRadius: 0.2,
        offset: Offset(0.0, 1.0),
      ),
    ],
  );

  EdgeInsetsGeometry searchBoxPadding = const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 0,
  );

  EdgeInsetsGeometry searchTextPadding = const EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 2,
  );
}
