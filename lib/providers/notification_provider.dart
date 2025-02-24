import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/model/cart_item.dart';
import 'package:pos/model/notification.dart';

import '../constant/constants.dart';

class NotificationProvider with ChangeNotifier {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  int selectedNotificationType = 0;
  Map<String, NotificationItem> _items = {};

  NotificationProvider() {
    final List<String> titles = [
      "Meeting at 07:30 PM",
      "Lunch with the team",
      "Project deadline reminder",
      "Catch-up with Sarah",
      "Client call scheduled",
      "Team-building activity",
      "Presentation review",
      "Budget planning session"
    ];

    final Random random = Random();

    // Function to generate a random date within the next 30 days
    DateTime getRandomDate() {
      int daysAhead = random.nextInt(30); // Random number of days (0-29)
      return DateTime.now().add(Duration(days: daysAhead));
    }

    // Your existing loop with random titles and dates
    for (int i = 0; i < random.nextInt(100); i++) {
      String title = titles[random.nextInt(titles.length)];
      DateTime randomDate = getRandomDate();

      addItem(
        "$i",
        title,
        "You have an upcoming notification regarding: $title.",
        randomDate.toString(),
      );
    }
  }

  // Get notifications
  Map<String, NotificationItem> get items {
    if(selectedNotificationType == 0) {
      return allItems;
    } else if(selectedNotificationType == 2) {
      return unreadItems;
    } else {
      return newItems;
    }
  }

  // Get unread notifications
  Map<String, NotificationItem> get unreadItems {
    return Map.fromEntries(
      _items.entries.where((entry) => !entry.value.isRead),
    );
  }

  // Get new notifications
  Map<String, NotificationItem> get newItems {
    // Filter the items based on a valid date
    var filteredItems = _items.entries.where((entry) => entry.value.date != "").toList();

    // Sort the filtered items by date in descending order
    filteredItems.sort((a, b) => b.value.date.compareTo(a.value.date));

    // Return a new map sorted by date
    return Map.fromEntries(filteredItems);
  }


  // Get all notifications
  Map<String, NotificationItem> get allItems {
    return Map.fromEntries(
      _items.entries,
    );
  }

  List<String> get getKeys {
    // Fetch keys based on selected type
    if (selectedNotificationType == 0) {
      return allItems.keys.toList();
    } else if (selectedNotificationType == 2) {
      return unreadItems.keys.toList();
    } else {
      return newItems.keys.toList();
    }
  }

  // Get the total number of items in the notifications
  int get notificationCount {
    // return _items.length;
    return Map.fromEntries(
      _items.entries.where((entry) => !entry.value.isRead),
    ).length;
  }

  // Add an item to the notifications list
  void addItem(String id, String title, String description, String date) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
            (existingItem) => NotificationItem(
          id: existingItem.id,
          title: existingItem.title,
          description: existingItem.description,
          isRead: true,
          date: existingItem.date
        ),
      );
    } else {
      final newItem = NotificationItem(
        id: id,
        title: title,
        description: description,
        isRead: false,
        date: date,
      );

      _items.putIfAbsent(id, () => newItem);
      final index = getKeys.indexOf(id);

      if (listKey.currentState != null) {
        listKey.currentState!.insertItem(
          index,
          duration: const Duration(milliseconds: 300),
        );
      }
    }

    notifyListeners();
  }


  // Remove an item with animation
  void removeItem(String id) {
    final int index = getKeys.indexOf(id);

    if (index >= 0) {
      NotificationItem removedItem = _items.remove(id)!;

      if (listKey.currentState != null) {
        listKey.currentState!.removeItem(
          index,
              (context, animation) => _buildRemovedItem(removedItem, animation),
          duration: const Duration(milliseconds: 900),
        );
      }
      notifyListeners();
    }
  }

// Build the widget for the removed item animation
  Widget _buildRemovedItem(NotificationItem item, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(defaultPadding),
          child: ListTile(
            title: Text(
              item.title,
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(item.description),
          ),
        ),
      ),
    );
  }

  // Change the notifications type
  void onNotificationTypeChange(int index) {
    selectedNotificationType = index;
    notifyListeners();
  }

  // Clear the notifications
  void clearItems() {
    _items = {};
    notifyListeners();
  }
}
