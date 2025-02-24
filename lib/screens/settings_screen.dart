import 'package:flutter/material.dart';
import 'package:pos/providers/settings_provider.dart';
import 'package:pos/util/responsive.dart';
import 'package:pos/widgets/country/components/supported_countries_map.dart';
import 'package:pos/widgets/dashboard/components/chart.dart';
import 'package:pos/widgets/settings/components/screen.dart';
import 'package:pos/widgets/settings/components/top_navigation.dart';
import 'package:provider/provider.dart';
import '../constant/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
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
                      Container(
                        decoration: const BoxDecoration(
                          // color: backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                        ),
                        child: const SettingsTopNavigation(),
                      ),
                      const SizedBox(height: defaultPadding),
                      const Row(
                        children: [
                          Expanded(child: SettingsBody()),
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
