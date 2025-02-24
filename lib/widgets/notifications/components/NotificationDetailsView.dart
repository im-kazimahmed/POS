import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/model/notification.dart';
import 'package:pos/providers/notification_provider.dart';
import 'package:provider/provider.dart';

class NotificationDetailsView extends StatelessWidget {
  const NotificationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final notificationProvider = Provider.of<NotificationProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
      ),
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Notifications"),
                      Text(
                        "You've ${notificationProvider.notificationCount} unread notifications",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: secondaryGrayColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    notificationProvider.clearItems();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
                    ),
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      "Mark all as read",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.green.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => notificationProvider.onNotificationTypeChange(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      label: Text(
                        "All",
                        style: GoogleFonts.poppins(
                          color: notificationProvider.selectedNotificationType == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                      backgroundColor: notificationProvider.selectedNotificationType == 0 ? Colors.black : Colors.grey[200],
                      side: BorderSide(
                        color: notificationProvider.selectedNotificationType == 0 ? Colors.black : Colors.grey[200]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => notificationProvider.onNotificationTypeChange(1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      label: Text(
                        "New",
                        style: GoogleFonts.poppins(
                          color: notificationProvider.selectedNotificationType == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                      backgroundColor: notificationProvider.selectedNotificationType == 1 ? Colors.black : Colors.grey[200],
                      side: BorderSide(
                        color: notificationProvider.selectedNotificationType == 1 ? Colors.black : Colors.grey[200]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => notificationProvider.onNotificationTypeChange(2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      label: Text(
                        "Unread",
                        style: GoogleFonts.poppins(
                          color: notificationProvider.selectedNotificationType == 2 ? Colors.white : Colors.black,
                        ),
                      ),
                      backgroundColor: notificationProvider.selectedNotificationType == 2 ? Colors.black : Colors.grey[200],
                      side: BorderSide(
                        color: notificationProvider.selectedNotificationType == 2 ? Colors.black : Colors.grey[200]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () => notificationProvider.onNotificationTypeChange(0),
                //   child: Text(
                //     'All',
                //     style: GoogleFonts.poppins(
                //       color: notificationProvider.selectedNotificationType == 0 ?
                //       primaryColor: Colors.grey,
                //       fontWeight: notificationProvider.selectedNotificationType == 0 ?
                //       FontWeight.bold: null,
                //     ),
                //   ),
                // ),
                // TextButton(
                //   onPressed: () => notificationProvider.onNotificationTypeChange(1),
                //   child: Text(
                //     'New',
                //     style: GoogleFonts.poppins(
                //       color: notificationProvider.selectedNotificationType == 1 ?
                //       primaryColor: Colors.grey,
                //       fontWeight: notificationProvider.selectedNotificationType == 1 ?
                //       FontWeight.bold: null,
                //     ),
                //   ),
                // ),
                // TextButton(
                //   onPressed: () => notificationProvider.onNotificationTypeChange(2),
                //   child: Text(
                //     'Unread',
                //     style: GoogleFonts.poppins(
                //       color: notificationProvider.selectedNotificationType == 2 ?
                //       primaryColor: Colors.grey,
                //       fontWeight: notificationProvider.selectedNotificationType == 2 ?
                //       FontWeight.bold: null,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(
              shrinkWrap: true,
              key: notificationProvider.listKey,
              padding: const EdgeInsets.all(defaultPadding),
              initialItemCount: notificationProvider.items.length,

              itemBuilder: (context, index, animation) {
                try{
                  String id = notificationProvider.getKeys[index];
                  NotificationItem notification = notificationProvider.items[id]!;
                  return SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      margin: const EdgeInsets.only(bottom: defaultHeight),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                notification.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              notification.date != "" ? DateFormat('yyyy-MM-dd').format(DateTime.parse(notification.date)): "",
                              style: GoogleFonts.poppins(fontSize: 12),
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          notification.description,
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: InkWell(
                          onTap: () => notificationProvider.removeItem(id),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 100), // Adjust width as needed
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(defaultRadius),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min, // This ensures the Row doesn't take all available space
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red.withOpacity(0.5)),
                                  onPressed: null,
                                ),
                                Text(
                                  "Delete",
                                  style: GoogleFonts.poppins(
                                    color: Colors.red.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(width: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } catch (e) {
                  return Container();
                }
              },
            ),
          ),
          // Expanded(
          //   child: AnimatedList(
          //     key: notificationProvider.listKey,
          //     padding: const EdgeInsets.all(defaultPadding),
          //     initialItemCount: notificationProvider.getKeys.length,
          //     itemBuilder: (context, index, animation) {
          //       String productId = notificationProvider.getKeys[index];
          //       NotificationItem notification = notificationProvider.items[productId]!;
          //
          //       return SizeTransition(
          //         sizeFactor: animation,
          //         axis: Axis.vertical,
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: backgroundColor,
          //             border: Border.all(color: Colors.grey.withOpacity(0.2)),
          //             borderRadius: BorderRadius.circular(defaultRadius),
          //           ),
          //           margin: const EdgeInsets.only(bottom: defaultHeight),
          //           child: ListTile(
          //             title: Text(
          //               notification.title,
          //               style: GoogleFonts.poppins(
          //                 fontSize: 14,
          //                 color: primaryColor,
          //               ),
          //             ),
          //             subtitle: Text(
          //               notification.description,
          //               style: GoogleFonts.poppins(fontSize: 12),
          //             ),
          //             trailing: InkWell(
          //               onTap: () => notificationProvider.removeItem(productId),
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color: Colors.red.withOpacity(0.1),
          //                   borderRadius: BorderRadius.circular(defaultRadius),
          //                 ),
          //                 child: Row(
          //                   children: [
          //                     IconButton(
          //                       icon: Icon(Icons.delete, color: Colors.red.withOpacity(0.5)),
          //                       onPressed: null,
          //                     ),
          //                     Text(
          //                       "Delete",
          //                       style: GoogleFonts.poppins(
          //                         color: Colors.red.withOpacity(0.5),
          //                       ),
          //                     ),
          //                     const SizedBox(width: 14),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          //   // child: ListView.builder(
          //   //   padding: const EdgeInsets.all(defaultPadding),
          //   //   itemCount: notifications.length,
          //   //   itemBuilder: (context, index) {
          //   //     String productId = notifications.keys.toList()[index];
          //   //     NotificationItem notification = notifications[productId]!;
          //   //
          //   //     return Container(
          //   //       // elevation: 2.1,
          //   //       // shadowColor: primaryColor,
          //   //       decoration: BoxDecoration(
          //   //         color: backgroundColor,
          //   //         border: Border.all(color: Colors.grey.withOpacity(0.2)),
          //   //         borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
          //   //         // shape: RoundedRectangleBorder(
          //   //         //   borderRadius: BorderRadius.circular(10.0),
          //   //         // ),
          //   //       ),
          //   //       margin: const EdgeInsets.only(bottom: defaultHeight),
          //   //       child: ListTile(
          //   //         // leading: CircleAvatar(
          //   //         //   backgroundColor: Colors.white,
          //   //         //   child: Icon(notification['icon'], color: primaryColor),
          //   //         // ),
          //   //         title: Text(
          //   //           notification.title,
          //   //           style: GoogleFonts.poppins(
          //   //             // fontWeight: FontWeight.bold,
          //   //             fontSize: 14,
          //   //             color: primaryColor,
          //   //           ),
          //   //         ),
          //   //         subtitle: Text(
          //   //           notification.description,
          //   //           style: GoogleFonts.poppins(fontSize: 12),
          //   //         ),
          //   //         trailing: Row(
          //   //           mainAxisSize: MainAxisSize.min,
          //   //           children: [
          //   //             // Container(
          //   //             //   padding: const EdgeInsets.symmetric(
          //   //             //     horizontal: 8.0,
          //   //             //     vertical: 4.0,
          //   //             //   ),
          //   //             //   decoration: BoxDecoration(
          //   //             //     color: notification['badgeColor'],
          //   //             //     borderRadius: BorderRadius.circular(5.0),
          //   //             //   ),
          //   //             //   child: Text(
          //   //             //     notification['badge'],
          //   //             //     style: GoogleFonts.poppins(
          //   //             //       color: Colors.white,
          //   //             //       fontSize: 12,
          //   //             //     ),
          //   //             //   ),
          //   //             // ),
          //   //             InkWell(
          //   //               onTap: () => notificationProvider.removeItem("1"),
          //   //               child: Container(
          //   //                 decoration: BoxDecoration(
          //   //                   color: Colors.red.withOpacity(0.1),
          //   //                   borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
          //   //                 ),
          //   //                 child: Row(
          //   //                   children: [
          //   //                     IconButton(
          //   //                       icon: Icon(Icons.delete, color: Colors.red.withOpacity(0.5)),
          //   //                       onPressed: null,
          //   //                     ),
          //   //                     Text(
          //   //                       "Delete",
          //   //                       style: GoogleFonts.poppins(
          //   //                         color: Colors.red.withOpacity(0.5),
          //   //                       ),
          //   //                     ),
          //   //                     const SizedBox(width: 14),
          //   //                   ],
          //   //                 ),
          //   //               ),
          //   //             ),
          //   //           ],
          //   //         ),
          //   //       ),
          //   //     );
          //   //   },
          //   // ),
          // ),
        ],
      ),
    );
  }
}
