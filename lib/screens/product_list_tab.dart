import 'dart:io';

import 'package:native_looking_store/components/platform_widgets/platform_sliver_app_bar.dart';
import 'package:native_looking_store/providers/app_state_provider.dart';
import 'package:native_looking_store/components/product_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductListTab extends StatelessWidget {
  const ProductListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = Platform.isIOS ? 'Cupertino Store' : 'Material Store';

    return Consumer<AppStateProvider>(
      builder: (context, model, child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            PlatformSliverAppBar(
              title: title,
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index < products.length) {
                      return ProductRowItem(
                        product: products[index],
                        lastItem: index == products.length - 1,
                      );
                    }
                    return null;
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
