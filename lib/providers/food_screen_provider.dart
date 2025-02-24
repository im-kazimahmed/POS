import 'package:flutter/material.dart';
import 'dart:developer';

class FoodScreenProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<ScrollController> scrollControllers = [];
  final ScrollController categoryScrollController = ScrollController();
  int selectedCategoryIndex = 0;

  FoodScreenProvider() {
    for (int i = 0; i < 10; i++) {
      scrollControllers.add(ScrollController());
      log("adding controller");
    }
  }

  final List<String> categories = [
    "All",
    "Soups",
    "Salads",
    "Pasta",
    "Bakery Products",
    "Soups",
    "Salads",
    "Pasta",
    "Bakery Products",
    "Soups",
    "Salads",
    "Pasta",
    "Bakery Products",
  ];

  final List<Map<String, dynamic>> foodItems = [
    {"name": "Ukrainian Borscht", "price": 85.00, "image": "assets/images/dish1.png"},
    {"name": "Finnish Fish Soup", "price": 75.00, "image": "assets/images/dish2.png"},
    {"name": "Ukrainian Borscht", "price": 65.00, "image": "assets/images/dish1.png"},
    {"name": "Finnish Fish Soup", "price": 55.00, "image": "assets/images/dish2.png"},
    {"name": "Ukrainian Borscht", "price": 45.00, "image": "assets/images/dish1.png"},
    {"name": "Finnish Fish Soup", "price": 35.00, "image": "assets/images/dish2.png"},
    {"name": "Ukrainian Borscht", "price": 25.00, "image": "assets/images/dish1.png"},
    {"name": "Finnish Fish Soup", "price": 15.00, "image": "assets/images/dish2.png"},
  ];

  // void onIndexChange(int index) {
  //   selectedIndex = index;
  //   selectedUserManagementIndex = 0;
  //   notifyListeners();
  //   if (_scaffoldKey.currentState!.isDrawerOpen) {
  //     _scaffoldKey.currentState!.closeDrawer();
  //   }
  // }

  void onCategoryIndexChange(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }


  getFoodItemsForCategory(selectedCategory) {

  }

  @override
  void dispose() {
    for (var controller in scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
