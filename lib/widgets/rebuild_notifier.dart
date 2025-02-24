import 'dart:developer';

import 'package:flutter/material.dart';

class RebuildNotifier extends StatelessWidget {
  final Widget child;
  final String widgetName;

  const RebuildNotifier({super.key, required this.child, required this.widgetName});

  @override
  Widget build(BuildContext context) {
    log("$widgetName rebuilt");
    print('$widgetName rebuilt');
    debugPrint('$widgetName rebuilt');
    return child;
  }
}
