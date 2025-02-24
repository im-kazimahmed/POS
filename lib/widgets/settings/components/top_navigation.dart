import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTopNavigation extends StatelessWidget {
  const SettingsTopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => settingsProvider.onStyleIndexChange(0),
              child: Container(
                decoration: BoxDecoration(
                  color: settingsProvider.testUIStyleIndex == 0 ?
                  backgroundColor: secondaryColor.withOpacity(0.1),
                  border: settingsProvider.testUIStyleIndex == 0 ?
                  const Border(
                    bottom: BorderSide(
                      color: secondaryColor,
                    ),
                  ): null,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(defaultPadding),
                child: Text(
                  "Style 1",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            InkWell(
              onTap: () => settingsProvider.onStyleIndexChange(1),
              child: Container(
                decoration: BoxDecoration(
                  color: settingsProvider.testUIStyleIndex == 1 ?
                  backgroundColor: secondaryColor.withOpacity(0.1),
                  border: settingsProvider.testUIStyleIndex == 1 ?
                  const Border(
                    bottom: BorderSide(
                      color: secondaryColor,
                    ),
                  ): null,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(defaultPadding),
                child: Text(
                  "Style 2",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultHeight),
        _buildNavigation(context, settingsProvider.testUIStyleIndex),
      ],
    );
  }

  // Function to build individual tab item
  Widget buildTabItem(String title, bool isSelected) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  _buildNavigation(BuildContext context, int testUIStyleIndex) {
    var size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxWidth: size.width, maxHeight: testUIStyleIndex == 0 ? 51: 100),
      child: Consumer<SettingsProvider>(
        builder: (context, value, child) {
          if(testUIStyleIndex == 0) {
            return Scrollbar(
              controller: value.tabsScrollController,
              thumbVisibility: true,
              thickness: 5,
              radius: const Radius.circular(10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.tabs.length,
                  controller: value.tabsScrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final String title = value.tabs[index];
                    final isSelected = index == value.selectedTabIndex;

                    return InkWell(
                      onTap: () => value.onTabIndexChange(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? backgroundColor: secondaryColor.withOpacity(0.1),
                          border: isSelected ? const Border(
                              bottom: BorderSide(
                                color: secondaryColor,
                              )
                          ): null,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: isSelected ? null: grayTextColor,
                          ),
                        ),
                      ),
                    );
                  }
              ),
            );
          } else {
            return Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              padding: const EdgeInsets.all(defaultPadding),
              child: Scrollbar(
                controller: value.tabsScrollController,
                thumbVisibility: true,
                thickness: 5,
                radius: const Radius.circular(10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.tabs.length,
                    controller: value.tabsScrollController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final String title = value.tabs[index];
                      final isSelected = index == value.selectedTabIndex;

                      return InkWell(
                        onTap: () => value.onTabIndexChange(index),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            label: Text(
                              title,
                              style: GoogleFonts.poppins(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            backgroundColor: isSelected ? Colors.black : Colors.grey[200],
                            side: BorderSide(
                              color: isSelected ? Colors.black : Colors.grey[200]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                      );
                    }
                ),
                // child: ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: value.tabs.length,
                //   controller: value.tabsScrollController,
                //   physics: const BouncingScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     final String title = value.tabs[index];
                //     final isSelected = index == value.selectedTabIndex;
                //
                //     return InkWell(
                //       onTap: () => value.onTabIndexChange(index),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Chip(
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(30.0),
                //           ),
                //           label: Text(
                //             title,
                //             style: GoogleFonts.poppins(
                //               color: isSelected ? Colors.white : Colors.black,
                //             ),
                //           ),
                //           backgroundColor: isSelected ? Colors.black : Colors.grey[200],
                //           side: BorderSide(
                //             color: isSelected ? Colors.black : Colors.grey[200]!,
                //             width: 1.0,
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ),
            );
          }
        },
      ),
      // child: ListView.builder(
      //   itemCount: settingsProvider.tabs.length,
      //   scrollDirection: Axis.horizontal,
      //   shrinkWrap: true,
      //   itemBuilder: (context, index) {
      //     String title = settingsProvider.tabs[index];
      //     bool isSelected = settingsProvider.selectedTabIndex == index;
      //     return Padding(
      //       padding: const EdgeInsets.all(defaultPadding),
      //       child: TextButton(
      //         onPressed: () => settingsProvider.onTabIndexChange(index),
      //         child: Text(
      //           title,
      //           style: GoogleFonts.poppins(
      //             color: isSelected ? Colors.black : Colors.grey,
      //             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
