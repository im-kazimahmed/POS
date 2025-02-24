import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/providers/message_provider.dart';
import 'package:pos/util/responsive.dart';
import 'package:pos/widgets/messages/components/threads_widget.dart';
import 'package:pos/widgets/messages/components/chat_widget.dart';
import 'package:provider/provider.dart';
import '../constant/constants.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final msgProvider = Provider.of<MessageProvider>(context);
    var size = MediaQuery.of(context).size;
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
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(defaultRadius),
                          ),
                        ),
                        width: size.width,
                        height: 50,
                        child: ListView.builder(
                          itemCount: msgProvider.messageTypes.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            String title = msgProvider.messageTypes[index]['name'];
                            double length = title.length.toDouble();
                            bool isSelected = msgProvider.selectedMsgTypeIndex == index;

                            return InkWell(
                              onTap: () => msgProvider.onMsgTypeIndexChange(index),
                              child: AnimatedScale(
                                scale: isSelected ? 1.1 : 0.9, // Scale up when selected
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
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
                              ),
                            );
                            // return InkWell(
                            //   onTap: () => msgProvider.onMsgTypeIndexChange(index),
                            //   child: AnimatedScale(
                            //     scale: isSelected ? 1.1 : 0.9, // Scale up when selected
                            //     duration: const Duration(milliseconds: 300),
                            //     curve: Curves.easeInOut,
                            //     child: Container(
                            //       // decoration: _getBoxDecoration(msgProvider.selectedMsgTypeIndex, index, secondaryColor),
                            //       padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                            //       child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           Container(
                            //             padding: const EdgeInsets.symmetric(vertical: 10.0),
                            //             child: Text(
                            //               title,
                            //               style: GoogleFonts.poppins(
                            //                 // color: textHeadingColor,
                            //               ),
                            //             ),
                            //           ),
                            //           if (isSelected)
                            //             Container(
                            //               decoration: const BoxDecoration(
                            //                 color: primaryColor,
                            //               ),
                            //               padding: EdgeInsets.symmetric(
                            //                 horizontal: length * 3.5,
                            //                 vertical: 0.8,
                            //               ),
                            //             ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                      ),
                      if(!Responsive.isMobile(context))
                        Column(
                          children: [
                            const SizedBox(height: defaultHeight),
                            Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                                  ),
                                  height: size.height,
                                  width: size.width / 5,
                                  child: const ThreadsWidget(),
                                ),
                                const SizedBox(width: defaultWidth),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: size.height,
                                    width: size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                                      color: backgroundColor,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: defaultPadding,
                                      right: defaultPadding,
                                      // top: defaultPadding,
                                      // bottom: 100,
                                    ),
                                    child: const ChatWidget(),
                                  ),
                                ),
                                // const SizedBox(width: 10),
                                // Expanded(child: SupportedCountriesMap()),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if(Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                    ),
                    height: 70,
                    width: size.width,
                    child: const ThreadsWidget(),
                  ),
                  const SizedBox(height: defaultHeight),
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
                      color: backgroundColor,
                    ),
                    padding: const EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      // top: defaultPadding,
                      // bottom: 100,
                    ),
                    child: const ChatWidget(),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  BoxDecoration? _getBoxDecoration(int selectedIndex, int index, Color secondaryColor) {
    if (selectedIndex == index) {
      if (index == 0) {
        return BoxDecoration(
          border: Border(
            right: BorderSide(
              color: secondaryColor.withOpacity(0.1),
            ),
          ),
        );
      } else if (index == 2) {
        return BoxDecoration(
          border: Border(
            left: BorderSide(
              color: secondaryColor.withOpacity(0.1),
            ),
          ),
        );
      } else if (index == 1) {
        return BoxDecoration(
          border: Border(
            right: BorderSide(
              color: secondaryColor.withOpacity(0.1),
            ),
            left: BorderSide(
              color: secondaryColor.withOpacity(0.1),
            ),
          ),
        );
      }
    }
    return null;
  }
}
