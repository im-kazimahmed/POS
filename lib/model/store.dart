// models/store.dart
import 'package:flutter/material.dart';

class Store {
  final int id;
  final String name;
  final String purchaseCode;
  final String location;
  final List<String> modules;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color backgroundColor;
  final bool status;

  Store({
    required this.id,
    required this.name,
    required this.purchaseCode,
    required this.location,
    required this.modules,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.backgroundColor,
    required this.status,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      modules: List<String>.from(json['available_modules']),
      purchaseCode: json['purchase_code_id'],
      primaryColor: json['primary_color'],
      secondaryColor: json['secondary_color'],
      tertiaryColor: json['tertiary_color'],
      backgroundColor: json['background_color'],
      status: json['status'] == 1 ? true: false,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['available_modules'] = modules;
    data['purchase_code_id'] = purchaseCode;
    data['primary_color'] = primaryColor;
    data['secondary_color'] = secondaryColor;
    data['tertiary_color'] = tertiaryColor;
    data['background_color'] = backgroundColor;
    data['status'] = status;
    return data;
  }
}
