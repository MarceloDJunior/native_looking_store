
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformSliverAppBar
    extends PlatformWidget<CupertinoSliverNavigationBar, SliverAppBar> {
  final String title;

  const PlatformSliverAppBar({required this.title, Key? key}) : super(key: key);

  @override
  SliverAppBar createAndroidWidget(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 130.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 17, bottom: 16.8),
        title: Text(title),
      ),
    );
  }

  @override
  CupertinoSliverNavigationBar createIosWidget(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(title),
    );
  }
}
