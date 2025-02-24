import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title;
  final int? numbers;
  final Color? color;
  final List<Color>? backgroundColors;
  final Color? numberColor;
  final Color? titleColor;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.numbers,
    this.color,
    this.backgroundColors,
    this.numberColor,
    this.titleColor,
  });
}
