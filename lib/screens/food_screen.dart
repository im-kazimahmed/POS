import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/widgets/food_and_drinks/components/users_details_view.dart';
import 'package:pos/widgets/rebuild_notifier.dart';
import 'package:provider/provider.dart';
import 'package:pos/providers/app_provider.dart';
import 'package:pos/providers/food_screen_provider.dart';
import 'package:pos/widgets/food_and_drinks/components/food_category_screen.dart';
import '../constant/constants.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_widget.dart';

class FoodScreen extends StatelessWidget {
  FoodScreen({super.key});

  final List<Widget> pages = [
    const FoodsScreen(),
    const FoodCategoryScreen(),
    const UserDetailsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuAppProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: RebuildNotifier(
            widgetName: 'Food Screen',
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: primaryColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => context.read<MenuAppProvider>().onUserManagementIndexChange(2),
                                  child: Text(
                                    "See All",
                                    style: GoogleFonts.poppins(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: defaultPadding),
                            Consumer<FoodScreenProvider>(
                              builder: (context, value, child) {
                                return Container(
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(defaultRadius),
                                  ),
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Scrollbar(
                                    controller: value.categoryScrollController,
                                    thumbVisibility: true,
                                    thickness: 5,
                                    radius: const Radius.circular(10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.categories.length,
                                      controller: value.categoryScrollController,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final isSelected = index == value.selectedCategoryIndex;

                                        return InkWell(
                                          onTap: () {
                                            value.onCategoryIndexChange(index);
                                            context.read<MenuAppProvider>().onUserManagementIndexChange(1);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: Chip(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                              label: Text(
                                                value.categories[index],
                                                style: GoogleFonts.poppins(
                                                  color: isSelected ? Colors.white : Colors.black,
                                                ),
                                              ),
                                              backgroundColor: isSelected ? Colors.black : Colors.grey[200],
                                              side: BorderSide(
                                                color: isSelected ? Colors.black : Colors.grey[200]!,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultHeight),
                  pages[context.read<MenuAppProvider>().selectedUserManagementIndex],
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class FoodsScreen extends StatelessWidget {
  const FoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Consumer<FoodScreenProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final List categories = value.categories.where((category) => category != "All").toList();
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      categories[index],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () => context.read<MenuAppProvider>().onUserManagementIndexChange(1),
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  padding: const EdgeInsets.only(
                    bottom: defaultPadding,
                    top: 5,
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
                  child: Scrollbar(
                    controller: value.scrollControllers[index],
                    thumbVisibility: true,
                    thickness: 5,
                    radius: const Radius.circular(10),
                    child: ListView.builder(
                      itemCount: value.foodItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      controller: value.scrollControllers[index],
                      physics: const BouncingScrollPhysics(),
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
                              if(quantity != null && quantity == 1) {
                                Provider.of<CartProvider>(context, listen: false).removeItem(index.toString());
                              } else {
                                Provider.of<CartProvider>(context, listen: false).updateItemQuantity(index.toString(), quantity! - 1);
                              }
                            } catch (e) {}
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: defaultHeight),
              ],
            );
          },
        );
      },
    );
  }
}

