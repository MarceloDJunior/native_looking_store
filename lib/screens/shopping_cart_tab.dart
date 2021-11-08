import 'package:native_looking_store/components/icons/location_icon.dart';
import 'package:native_looking_store/components/icons/mail_icon.dart';
import 'package:native_looking_store/components/icons/person_icon.dart';
import 'package:native_looking_store/components/platform_widgets/platform_date_time_picker.dart';
import 'package:native_looking_store/components/platform_widgets/platform_sliver_app_bar.dart';
import 'package:native_looking_store/components/platform_widgets/platform_text_field.dart';
import 'package:native_looking_store/components/shopping_cart_item.dart';
import 'package:native_looking_store/providers/app_state_provider.dart';
import 'package:native_looking_store/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShoppingCartTab extends StatefulWidget {
  const ShoppingCartTab({Key? key}) : super(key: key);

  @override
  _ShoppingCartTabState createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  String? name;
  String? email;
  String? location;
  String? pin;
  DateTime dateTime = DateTime.now();
  final _currencyFormat = NumberFormat.currency(symbol: '\$');

  Widget _buildNameField() {
    return PlatformTextField(
      prefix: PersonIcon(
        color: Styles.inputIconColor,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      boxDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: Styles.borderColor,
          ),
        ),
      ),
      label: 'Name',
      onChanged: (newName) {
        setState(() {
          name = newName;
        });
      },
    );
  }

  Widget _buildEmailField() {
    return PlatformTextField(
      prefix: MailIcon(
        color: Styles.inputIconColor,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      boxDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: Styles.borderColor,
          ),
        ),
      ),
      label: 'Email',
    );
  }

  Widget _buildLocationField() {
    return PlatformTextField(
      prefix: LocationIcon(
        color: Styles.inputIconColor,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      boxDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: Styles.borderColor,
          ),
        ),
      ),
      label: 'Location',
    );
  }

  Widget _buildDateAndTimePicker(BuildContext context) {
    return PlatformDateTimePicker(
      label: 'Delivery Time',
      dateTime: dateTime,
      onDateTimeChanged: (newDateTime) {
        setState(() {
          dateTime = newDateTime;
        });
      },
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(
      AppStateProvider model) {
    return SliverChildBuilderDelegate(
      (context, index) {
        final productIndex = index - 4;
        switch (index) {
          case 0:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildNameField(),
            );
          case 1:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildEmailField(),
            );
          case 2:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildLocationField(),
            );
          case 3:
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: _buildDateAndTimePicker(context),
            );
          default:
            if (model.productsInCart.length > productIndex) {
              return ShoppingCartItem(
                index: index,
                product: model.getProductById(
                    model.productsInCart.keys.toList()[productIndex]),
                quantity: model.productsInCart.values.toList()[productIndex],
                lastItem: productIndex == model.productsInCart.length - 1,
                formatter: _currencyFormat,
              );
            } else if (model.productsInCart.keys.length == productIndex &&
                model.productsInCart.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Shipping '
                          '${_currencyFormat.format(model.shippingCost)}',
                          style: Styles.productRowItemPrice,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tax ${_currencyFormat.format(model.tax)}',
                          style: Styles.productRowItemPrice,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Total ${_currencyFormat.format(model.totalCost)}',
                          style: Styles.productRowTotal,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            const PlatformSliverAppBar(
              title: 'Shopping Cart',
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 4),
              sliver: SliverList(
                delegate: _buildSliverChildBuilderDelegate(model),
              ),
            ),
          ],
        );
      },
    );
  }
}
