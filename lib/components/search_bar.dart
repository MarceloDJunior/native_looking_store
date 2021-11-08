import 'package:native_looking_store/components/icons/clear_icon.dart';
import 'package:native_looking_store/components/icons/search_icon.dart';
import 'package:native_looking_store/components/platform_widgets/platform_text_field.dart';
import 'package:native_looking_store/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.controller,
    required this.focusNode,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: Styles.searchBoxDecoration,
      child: Padding(
        padding: Styles.searchBoxPadding,
        child: Row(
          children: [
            SearchIcon(
              color: Styles.searchIconColor,
            ),
            Expanded(
              child: Padding(
                padding: Styles.searchTextPadding,
                child: PlatformTextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: Styles.searchText,
                  cursorColor: Styles.searchCursorColor,
                  placeholder: 'Search...',
                  inputDecoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.clear,
              child: ClearIcon(
                color: Styles.searchIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
