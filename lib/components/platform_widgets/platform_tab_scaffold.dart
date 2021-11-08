import 'package:native_looking_store/components/platform_widgets/platform_tab_bar.dart';
import 'package:native_looking_store/components/platform_widgets/platform_widget.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class PlatformTabScaffold
    extends PlatformWidget<CupertinoTabScaffold, Scaffold> {
  final PlatformTabBar tabBar;
  final Widget Function(BuildContext, int) tabBuilder;

  const PlatformTabScaffold({
    required this.tabBar,
    required this.tabBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: tabBar,
      body: tabBuilder(context, tabBar.currentIndex),
    );
  }

  @override
  CupertinoTabScaffold createIosWidget(BuildContext context) {
    CupertinoTabBar _tabBar = CupertinoTabBar(items: tabBar.items);
    return CupertinoTabScaffold(tabBar: _tabBar, tabBuilder: tabBuilder);
  }
}
