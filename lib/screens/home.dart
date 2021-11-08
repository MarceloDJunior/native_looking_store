import 'package:native_looking_store/components/icons/home_icon.dart';
import 'package:native_looking_store/components/icons/search_icon.dart';
import 'package:native_looking_store/components/icons/shopping_cart_icon.dart';
import 'package:native_looking_store/components/platform_widgets/platform_scaffold.dart';
import 'package:native_looking_store/components/platform_widgets/platform_tab_bar.dart';
import 'package:native_looking_store/components/platform_widgets/platform_tab_scaffold.dart';
import 'package:native_looking_store/components/platform_widgets/platform_tab_view.dart';
import 'package:native_looking_store/screens/product_list_tab.dart';
import 'package:native_looking_store/screens/search_tab.dart';
import 'package:native_looking_store/screens/shopping_cart_tab.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      tabBar: PlatformTabBar(
        iconSize: 23,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: HomeIcon(),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: SearchIcon(),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ShoppingCartIcon(),
            label: 'Cart',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const PlatformTabView(
              child: PlatformScaffold(
                child: ProductListTab(),
              ),
            );
          case 1:
            return const PlatformTabView(
              child: PlatformScaffold(
                child: SearchTab(),
              ),
            );
          case 2:
            return const PlatformTabView(
              child: PlatformScaffold(
                child: ShoppingCartTab(),
              ),
            );
        }
        return Container();
      },
    );
  }
}
