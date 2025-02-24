import 'package:flutter/material.dart';
import 'package:pos/util/responsive.dart';

class ResponsiveLayout extends StatelessWidget {
  final List<Widget> desktopChildren;
  final List<Widget> mobileChildren;
  final double spacing; // Optional: Adjust spacing between widgets

  const ResponsiveLayout({
    super.key,
    required this.desktopChildren,
    required this.mobileChildren,
    this.spacing = 10.0, // Default spacing
  });

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
      children: desktopChildren
          .expand((widget) => [Expanded(child: widget), SizedBox(width: spacing)])
          .toList()
        ..removeLast(), // Remove trailing SizedBox
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: mobileChildren
          .expand((widget) => [widget, SizedBox(height: spacing)])
          .toList()
        ..removeLast(), // Remove trailing SizedBox
    );
  }
}
