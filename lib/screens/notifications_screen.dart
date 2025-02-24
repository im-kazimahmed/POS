import 'package:flutter/material.dart';
import 'package:pos/providers/notification_provider.dart';
import 'package:pos/util/responsive.dart';
import 'package:pos/widgets/country/components/supported_countries_map.dart';
import 'package:pos/widgets/dashboard/components/chart.dart';
import 'package:pos/widgets/notifications/components/NotificationDetailsView.dart';
import 'package:provider/provider.dart';
import '../constant/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
                      const NotificationDetailsView(),
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
