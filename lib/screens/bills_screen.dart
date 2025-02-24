import 'package:flutter/material.dart';
import 'package:pos/util/responsive.dart';
import 'package:pos/widgets/bills/components/bill_details_view.dart';
import '../constant/constants.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const BillDetailsView(),
                      const SizedBox(height: defaultPadding),
                      if(!Responsive.isMobile(context))
                        const Row(
                          children: [
                            // Expanded(child: Chart()),
                            SizedBox(width: 10),
                            // Expanded(child: SupportedCountriesMap()),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // if(Responsive.isMobile(context))
          //   const Padding(
          //     padding: EdgeInsets.all(defaultPadding),
          //     child: Column(
          //       children: [
          //         Chart(),
          //         SizedBox(height: 20),
          //         SupportedCountriesMap(),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }
}
