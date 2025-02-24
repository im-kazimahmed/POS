import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: secondaryColor,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Users",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: defaultPadding),
          const Divider(),
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 50,
                startDegreeOffset: -20,
                sections: paiChartSelectionDatas,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF39C12),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5.0),
              ),
              const SizedBox(width: 5),
              Text(
                "Student",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff00A65A),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5.0),
              ),
              const SizedBox(width: 5),
              Text(
                "Non-Student",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ],
          )
          // Positioned.fill(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const SizedBox(height: defaultPadding),
          //       Text(
          //         "29.1",
          //         style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w600,
          //               height: 0.5,
          //             ),
          //       ),
          //       const Text("of 128GB")
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: const Color(0xff00A65A),
    value: 50,
    showTitle: false,
    // radius: 25,
  ),
  PieChartSectionData(
    color: const Color(0xFFFFCF26),
    value: 50,
    showTitle: false,
    // radius: 19,
  ),
];
