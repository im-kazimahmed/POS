import 'package:flutter/material.dart';
import 'package:pos/widgets/rebuild_notifier.dart';
import 'package:provider/provider.dart';
import 'package:pos/providers/app_provider.dart';
import 'package:pos/providers/food_screen_provider.dart';
import 'dart:developer';

import '../../../constant/constants.dart';
import '../../../providers/cart_provider.dart';
import '../../product_widget.dart';

class FoodCategoryScreen extends StatelessWidget {
  const FoodCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;
    final size = MediaQuery.of(context).size;

    // Fetch category list from FoodScreenController
    final foodScreenProvider = Provider.of<FoodScreenProvider>(context, listen: false);
    final categories = foodScreenProvider.categories;

    return RebuildNotifier(
      widgetName: 'Food Category Screen',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  foodScreenProvider.selectedCategoryIndex = 0;
                  context.read<MenuAppProvider>().onUserManagementIndexChange(0);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: primaryColor,
                ),
              ),
              const SizedBox(width: defaultWidth),
              Text(
                "Soup",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  // color: textHeadingColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food Items Grid
                    Consumer<FoodScreenProvider>(
                      builder: (context, value, child) {
                        // Filter food items based on selected category
                        // final foodItemsForCategory = value.getFoodItemsForCategory(value.selectedCategory);

                        return Container(
                          height: size.height,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                          padding: const EdgeInsets.all(defaultPadding),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              // Determine the number of columns based on the screen width
                              int columns = (constraints.maxWidth / 300).floor();

                              return GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: columns,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.90,
                                ),
                                itemCount: value.foodItems.length,
                                itemBuilder: (context, index) {
                                  int? quantity = cartItems[index.toString()]?.quantity;
                                  return ProductWidget(
                                    name: value.foodItems[index]['name'],
                                    price: value.foodItems[index]['price'],
                                    image: value.foodItems[index]['image'],
                                    quantity: quantity ?? 0,
                                    onAdd: () {
                                      Provider.of<MenuAppProvider>(context, listen: false).openCart();
                                      Provider.of<CartProvider>(context, listen: false).addItem(
                                        index.toString(),
                                        value.foodItems[index]['name'],
                                        value.foodItems[index]['price'],
                                      );
                                    },
                                    onRemove: () {
                                      try {
                                        int? quantity = cartItems[index.toString()]?.quantity;
                                        if (quantity != null && quantity == 1) {
                                          Provider.of<CartProvider>(context, listen: false).removeItem(index.toString());
                                        } else {
                                          Provider.of<CartProvider>(context, listen: false).updateItemQuantity(
                                            index.toString(),
                                            quantity! - 1,
                                          );
                                        }
                                      } catch (e) {
                                        log('Error: $e');
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
