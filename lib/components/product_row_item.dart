import 'package:native_looking_store/components/icons/plus_icon.dart';
import 'package:native_looking_store/components/platform_widgets/platform_button.dart';
import 'package:native_looking_store/model/product.dart';
import 'package:native_looking_store/providers/app_state_provider.dart';
import 'package:native_looking_store/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductRowItem extends StatelessWidget {
  const ProductRowItem({
    required this.product,
    required this.lastItem,
    Key? key,
  }) : super(key: key);

  final Product product;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: Styles.productRowItemName,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\$${product.price}',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
          PlatformButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              final provider =
                  Provider.of<AppStateProvider>(context, listen: false);
              provider.addProductToCart(product.id);
            },
            child: const PlusIcon(),
          ),
        ],
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}
