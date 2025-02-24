import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/model/cart_item.dart';
import 'package:pos/widgets/cart_item_widget.dart';
import 'package:pos/widgets/rebuild_notifier.dart';
import 'package:provider/provider.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/providers/app_provider.dart';
import '../providers/cart_provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Consumer<MenuAppProvider>(
      builder: (context, value, child) {
        return RebuildNotifier(
          widgetName: 'Cart Widget',
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            backgroundColor: secondaryColor,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    // physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: primaryColor,
                        ),
                        padding: const EdgeInsets.all(sideMenuLogoPadding),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Current Order",
                                style: GoogleFonts.poppins(
                                  color: textHeadingColor,
                                  // fontSize: 22,
                                  // fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () => cartProvider.clearCart(),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: grayColor,
                                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                                  ),
                                  padding: const EdgeInsets.all(defaultPadding - 12),
                                  child: Icon(
                                    Icons.cleaning_services,
                                    color: grayLightOpacityColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: defaultPadding,
                          right: defaultPadding,
                          top: defaultPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "User",
                              style: GoogleFonts.poppins(
                                color: textHeadingColor,
                                // fontSize: 22,
                                // fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}', // This gets the current day, month, and year
                              style: GoogleFonts.poppins(
                                color: grayLightOpacityColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                          ),
                          // padding: const EdgeInsets.all(defaultPadding),
                          margin: const EdgeInsets.all(defaultPadding - 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartItems.length,
                            padding: const EdgeInsets.all(defaultPadding),
                            itemBuilder: (context, index) {
                              String productId = cartItems.keys.toList()[index];
                              CartItem item = cartItems[productId]!;

                              return Consumer<CartProvider>(
                                builder: (context, controller, child) {
                                  return CartItemWidget(
                                    name: item.productName,
                                    price: item.price.toString(),
                                    quantity: item.quantity.toString(),
                                    onAdd: () {
                                      Provider.of<CartProvider>(context, listen: false).addItem(
                                        productId,
                                        item.productName,
                                        item.price,
                                      );
                                    },
                                    onRemove: () {
                                      int? quantity = cartItems[productId]?.quantity;
                                      if(quantity != null && quantity == 1) {
                                        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
                                      } else {
                                        Provider.of<CartProvider>(context, listen: false).updateItemQuantity(productId, quantity! - 1);
                                      }
                                    },
                                  );
                                }
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding - 10),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                            ),
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "Subtotal",
                                          style: GoogleFonts.poppins(
                                            color: tertiaryColor,
                                            fontWeight: FontWeight.w100,

                                          ),
                                        ),
                                      ),
                                      Text(
                                        "\$10.00",
                                        style: GoogleFonts.poppins(
                                          color: textHeadingColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(height: defaultHeight),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Tax",
                                          style: GoogleFonts.poppins(
                                            color: tertiaryColor,
                                            fontWeight: FontWeight.w100,

                                          ),
                                        ),
                                      ),
                                      Text(
                                        "\$1.00",
                                        style: GoogleFonts.poppins(
                                          color: textHeadingColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(height: defaultHeight),
                                const Divider(
                                  thickness: 1.2,
                                ),
                                // const SizedBox(height: defaultHeight),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Total",
                                          style: GoogleFonts.poppins(
                                            color: tertiaryColor,
                                            fontWeight: FontWeight.w100,

                                          ),
                                        ),
                                      ),
                                      Text(
                                        "\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                                        style: GoogleFonts.poppins(
                                          color: textHeadingColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding - 10),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                            ),
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildPaymentButton("Cash", "Cash", cartProvider.selectedButton),
                                      buildPaymentButton("Debit", "Debit", cartProvider.selectedButton),
                                      buildPaymentButton("E-Wallet", "E-Wallet", cartProvider.selectedButton),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: defaultHeight),
                                buildPlaceOrderButton(cartProvider.placeOrderBtn),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      context.read<MenuAppProvider>().controlCart();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget buildPaymentButton(String label, String buttonName, selectedButton) {
    return GestureDetector(
      onTap: () {
        selectedButton.value = buttonName;
      },
      child: ValueListenableBuilder<String>(
        valueListenable: selectedButton,
        builder: (context, value, child) {
          final isSelected = value == buttonName;
          final backgroundColor = isSelected ? textHeadingColor : grayColor;
          final textColor = isSelected ? primaryColor : textHeadingColor;

          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding - 5,
              horizontal: defaultPadding + 5,
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  Widget buildPlaceOrderButton(ValueNotifier<Map<String, Color>> notifier) {
    return MouseRegion(
      onEnter: (_) => notifier.value = {
        'background': textHeadingColor,
        'text': primaryColor,
      },
      onExit: (_) => notifier.value = {
        'background': grayColor,
        'text': textHeadingColor,
      },
      child: ValueListenableBuilder<Map<String, Color>>(
        valueListenable: notifier,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              color: value['background'],
              borderRadius: const BorderRadius.all(
                Radius.circular(defaultRadius),
              ),
            ),
            padding: const EdgeInsets.all(defaultPadding),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "Place order",
              style: GoogleFonts.poppins(
                color: value['text'],
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

}
