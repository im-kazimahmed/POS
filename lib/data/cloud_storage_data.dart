import 'package:flutter/material.dart';

import '../constant/constants.dart';
import '../model/storage.dart';

List demoMyFiles = [
  CloudStorageInfo(
    title: "Total Customers",
    numbers: 100,
    svgSrc: "assets/icons/student.svg",
    color: Colors.white,
    backgroundColors: [
      const Color(0xff00FF65),
      const Color(0xff48DE83),
    ],
    numberColor: const Color(0xffFFFFFF),
    titleColor: const Color(0xffFFFFFF),
  ),
  CloudStorageInfo(
    title: "Revenue",
    numbers: 100,
    svgSrc: "assets/icons/attendance.svg",
    color: Colors.white,
    backgroundColors: [
      const Color(0xff4020E2),
      const Color(0xff7B61FF),
    ],
    numberColor: const Color(0xffFFFFFF),
    titleColor: const Color(0xffFFFFFF),
  ),
  CloudStorageInfo(
    title: "Foods",
    numbers: 150,
    svgSrc: "assets/icons/menu.svg",
    color: const Color(0xFFA4CDFF),
    backgroundColors: [
      const Color(0xffFE6A29),
      const Color(0xffB5613C),
    ],
    numberColor: const Color(0xffFFFFFF),
    titleColor: const Color(0xffFFFFFF),
  ),
];
