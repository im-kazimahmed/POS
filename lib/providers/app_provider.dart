import 'package:flutter/material.dart';

class MenuAppProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isCartOpened = false;
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  int selectedIndex = 0;
  int selectedUserManagementIndex = 0;

  final List sideBarMenus = [
    {"title": "Dashboard", "route": 0},
    {"title": "Food & Drinks", "route": 1},
    {"title": "Messages", "route": 2},
    {"title": "Bills", "route": 3},
    {"title": "Divider", "route": 0},
    {"title": "Settings", "route": 4},
    {"title": "Notifications", "route": 5},
  ];

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void controlCart() {
    isCartOpened = !isCartOpened;
    notifyListeners();
  }

  void openCart() {
    isCartOpened = true;
    notifyListeners();
  }

  void onIndexChange(int index) {
    selectedIndex = index;
    selectedUserManagementIndex = 0;
    notifyListeners();
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
    }
  }

  void onUserManagementIndexChange(int index) {
    selectedUserManagementIndex = index;
    notifyListeners();
  }
}
