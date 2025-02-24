import 'package:flutter/material.dart';
import 'package:pos/util/responsive.dart';


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pos/util/responsive.dart';
// import 'package:pos/widgets/bills/components/bill_details_view.dart';
// import '../constant/constants.dart';
//
// class PrototypeWelcome extends StatelessWidget {
//   const PrototypeWelcome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: defaultHeight),
//             Text(
//               "Select App",
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Column(
//                       children: [
//                         if(!Responsive.isMobile(context))
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 decoration:  BoxDecoration(
//                                   color: primaryColor,
//                                   borderRadius: BorderRadius.circular(defaultRadius),
//                                 ),
//                                 padding: const EdgeInsets.all(defaultPadding),
//                                 child: Text(
//                                   "Vendor",
//                                   style: GoogleFonts.poppins(
//                                     color: textHeadingColor,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: defaultWidth),
//                               Container(
//                                 decoration:  BoxDecoration(
//                                   color: primaryColor,
//                                   borderRadius: BorderRadius.circular(defaultRadius),
//                                 ),
//                                 padding: const EdgeInsets.all(defaultPadding),
//                                 child: Text(
//                                   "Kitchen",
//                                   style: GoogleFonts.poppins(
//                                     color: textHeadingColor,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: defaultWidth),
//                               Container(
//                                 decoration:  BoxDecoration(
//                                   color: primaryColor,
//                                   borderRadius: BorderRadius.circular(defaultRadius),
//                                 ),
//                                 padding: const EdgeInsets.all(defaultPadding),
//                                 child: Text(
//                                   "Cashier",
//                                   style: GoogleFonts.poppins(
//                                     color: textHeadingColor,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: defaultWidth),
//                               Container(
//                                 decoration:  BoxDecoration(
//                                   color: primaryColor,
//                                   borderRadius: BorderRadius.circular(defaultRadius),
//                                 ),
//                                 padding: const EdgeInsets.all(defaultPadding),
//                                 child: Text(
//                                   "User App",
//                                   style: GoogleFonts.poppins(
//                                     color: textHeadingColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if(Responsive.isMobile(context))
//               Padding(
//                 padding: const EdgeInsets.all(defaultPadding),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration:  BoxDecoration(
//                         color: primaryColor,
//                         borderRadius: BorderRadius.circular(defaultRadius),
//                       ),
//                       padding: const EdgeInsets.all(defaultPadding),
//                       child: Text(
//                         "Vendor",
//                         style: GoogleFonts.poppins(
//                           color: textHeadingColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: defaultHeight),
//                     Container(
//                       decoration:  BoxDecoration(
//                         color: primaryColor,
//                         borderRadius: BorderRadius.circular(defaultRadius),
//                       ),
//                       padding: const EdgeInsets.all(defaultPadding),
//                       child: Text(
//                         "Kitchen",
//                         style: GoogleFonts.poppins(
//                           color: textHeadingColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: defaultHeight),
//                     Container(
//                       decoration:  BoxDecoration(
//                         color: primaryColor,
//                         borderRadius: BorderRadius.circular(defaultRadius),
//                       ),
//                       padding: const EdgeInsets.all(defaultPadding),
//                       child: Text(
//                         "Cashier",
//                         style: GoogleFonts.poppins(
//                           color: textHeadingColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: defaultHeight),
//                     Container(
//                       decoration:  BoxDecoration(
//                         color: primaryColor,
//                         borderRadius: BorderRadius.circular(defaultRadius),
//                       ),
//                       padding: const EdgeInsets.all(defaultPadding),
//                       child: Text(
//                         "User App",
//                         style: GoogleFonts.poppins(
//                           color: textHeadingColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
