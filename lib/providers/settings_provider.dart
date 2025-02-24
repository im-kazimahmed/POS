import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:pos/model/cart_item.dart';
import 'package:pos/model/notification.dart';

import '../constant/constants.dart';

class SettingsProvider with ChangeNotifier {
  int selectedTabIndex = 0;
  int testUIStyleIndex = 0;
  final ScrollController tabsScrollController = ScrollController();
  final TextEditingController txtExpiryController = TextEditingController();
  // Map<String, NotificationItem> _items = {};

  final List<String> tabs = [
    "My details",
    "Profile",
    "Password",
    "Team",
    "Billings",
    "Plan",
    "Email",
    "Notifications",
  ];

  // Change the settings tab
  void onTabIndexChange(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  // this is for testing purpose only
  onStyleIndexChange(int i) {
    testUIStyleIndex = i;
    notifyListeners();
  }
}
