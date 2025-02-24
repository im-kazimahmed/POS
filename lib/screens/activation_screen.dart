import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/constant/images.dart';
import 'package:pos/model/store.dart';
import 'package:pos/providers/store_provider.dart';
import 'package:pos/util/responsive.dart';
import 'package:pos/widgets/stepper_widget.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class ActivationScreen extends StatefulWidget {
//   const ActivationScreen({super.key});
//
//   @override
//   State<ActivationScreen> createState() => _ActivationScreenState();
// }
//
// class _ActivationScreenState extends State<ActivationScreen> {
//   int activeStep = 0;
//   int activeStep2 = 0;
//   int reachedStep = 0;
//   int upperBound = 5;
//   // double progress = 0.2;
//   Set<int> reachedSteps = <int>{0, 2, 4, 5};
//
//   // void increaseProgress() {
//   //   if (progress < 1) {
//   //     setState(() => progress += 0.2);
//   //   } else {
//   //     setState(() => progress = 0);
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return Row(
//                 children: [
//                   // Left Section: Red background with text
//                   if(!Responsive.isMobile(context))
//                     Expanded(
//                       flex: 1,
//                       child: Container(
//                         color: primaryColor, // Dark red color
//                         padding: const EdgeInsets.all(40),
//                         child: const Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Welcome to POS, Morgan!',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Verify your recovery email',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   // Right Section: Form with connected steps and email input
//                   Expanded(
//                     flex: 1,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Connected steps progress bar
//                           SizedBox(
//                             height: 120,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: EasyStepper(
//                                     enableStepTapping: false,
//                                     activeStep: activeStep,
//                                     lineStyle: const LineStyle(
//                                       lineLength: 70,
//                                       lineSpace: 0,
//                                       lineType: LineType.normal,
//                                       defaultLineColor: Colors.white,
//                                       finishedLineColor: primaryColor,
//                                     ),
//                                     defaultStepBorderType: BorderType.normal,
//                                     activeStepBorderColor: primaryColor,
//                                     activeStepTextColor: primaryColor,
//                                     finishedStepTextColor: primaryColor,
//                                     internalPadding: 0,
//                                     showLoadingAnimation: true,
//                                     stepRadius: 10,
//                                     showStepBorder: true,
//                                     steps: [
//                                       EasyStep(
//                                         customStep: CircleAvatar(
//                                           radius: 8,
//                                           backgroundColor: primaryColor,
//                                           child: CircleAvatar(
//                                             radius: 7,
//                                             backgroundColor:
//                                             activeStep >= 0 ? primaryColor : secondaryColor,
//                                           ),
//                                         ),
//                                         title: 'Activation',
//                                         // customTitle: Text(
//                                         //   "Activation",
//                                         //   textAlign: TextAlign.center,
//                                         //   overflow: TextOverflow.ellipsis,
//                                         //   style: GoogleFonts.poppins(
//                                         //     fontSize: 12,
//                                         //   ),
//                                         // ),
//                                       ),
//                                       EasyStep(
//                                         customStep: CircleAvatar(
//                                           radius: 8,
//                                           backgroundColor: Colors.white,
//                                           child: CircleAvatar(
//                                             radius: 7,
//                                             backgroundColor:
//                                             activeStep >= 1 ? Colors.orange : Colors.white,
//                                           ),
//                                         ),
//                                         title: 'Store Details',
//                                         // customTitle: Text(
//                                         //   "Store Details",
//                                         //   textAlign: TextAlign.center,
//                                         //   overflow: TextOverflow.ellipsis,
//                                         //   style: GoogleFonts.poppins(
//                                         //     fontSize: 12,
//                                         //   ),
//                                         // ),
//                                         topTitle: true,
//                                       ),
//                                       EasyStep(
//                                         customStep: CircleAvatar(
//                                           radius: 8,
//                                           backgroundColor: Colors.white,
//                                           child: CircleAvatar(
//                                             radius: 7,
//                                             backgroundColor:
//                                             activeStep >= 2 ? Colors.orange : Colors.white,
//                                           ),
//                                         ),
//                                         title: 'Preparing',
//                                         // customTitle: Text(
//                                         //   "Preparing",
//                                         //   textAlign: TextAlign.center,
//                                         //   overflow: TextOverflow.ellipsis,
//                                         //   style: GoogleFonts.poppins(
//                                         //     fontSize: 12,
//                                         //   ),
//                                         // ),
//                                       ),
//                                     ],
//                                     onStepReached: (index) =>
//                                         setState(() => activeStep = index),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: defaultHeight),
//                           // Title
//                           Text(
//                             'Add recovery email',
//                             style: GoogleFonts.poppins(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: defaultHeight),
//                           Text(
//                             'Your recovery email is used to help you get back into your OU account if you forget your password or can’t sign in.',
//                             style: GoogleFonts.poppins(color: Colors.grey[700]),
//                           ),
//                           const SizedBox(height: defaultHeight),
//                           // Email input field
//                           const TextField(
//                             decoration: InputDecoration(
//                               labelText: 'Recovery email',
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                           const SizedBox(height: defaultHeight),
//                           Text(
//                             'A 6-digit verification code will be sent to the provided email address.',
//                             style: GoogleFonts.poppins(color: Colors.grey[600]),
//                           ),
//                           const SizedBox(height: defaultHeight),
//                           // Send verification button
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 // primary: Colors.blue,
//                                 padding: const EdgeInsets.symmetric(vertical: 16),
//                               ),
//                               child: Text(
//                                 'Send verification code',
//                                 style: GoogleFonts.poppins(fontSize: 16),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool _allowTabStepping(int index, StepEnabling enabling) {
//     return enabling == StepEnabling.sequential
//         ? index <= reachedStep
//         : reachedSteps.contains(index);
//   }
//
//   /// Returns the next button.
//   Widget _nextStep(StepEnabling enabling) {
//     return IconButton(
//       onPressed: () {
//         if (activeStep2 < upperBound) {
//           setState(() {
//             if (enabling == StepEnabling.sequential) {
//               ++activeStep2;
//               if (reachedStep < activeStep2) {
//                 reachedStep = activeStep2;
//               }
//             } else {
//               activeStep2 =
//                   reachedSteps.firstWhere((element) => element > activeStep2);
//             }
//           });
//         }
//       },
//       icon: const Icon(Icons.arrow_forward_ios),
//     );
//   }
//
//   /// Returns the previous button.
//   Widget _previousStep(StepEnabling enabling) {
//     return IconButton(
//       onPressed: () {
//         if (activeStep2 > 0) {
//           setState(() => enabling == StepEnabling.sequential
//               ? --activeStep2
//               : activeStep2 =
//               reachedSteps.lastWhere((element) => element < activeStep2));
//         }
//       },
//       icon: const Icon(Icons.arrow_back_ios),
//     );
//   }
// }

enum StepEnabling { sequential, individual }

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final int activeStep = 0;
  final int activeStep2 = 0;
  final int reachedStep = 0;
  final int upperBound = 5;
  // double progress = 0.2;
  final Set<int> reachedSteps = <int>{0, 2, 4, 5};

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final storeProvider = Provider.of<StoreProvider>(context);
    Store? store = storeProvider.store;
    int activeStep = storeProvider.activeStep;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              // Left Section: Red background with text
              if(!Responsive.isMobile(context))
                Expanded(
                  flex: 1,
                  child: Container(
                    color: store?.primaryColor ?? primaryColor,
                    padding: EdgeInsets.all(!Responsive.isMobile(context) ? 40 : defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to ${store?.name ?? "POS"}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Login or create account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => storeProvider.onStepChange(activeStep+1),
                          child: Column(
                            children: [
                              Lottie.asset(
                                'assets/animations/help_bulb.json',
                                height: 80,
                                width: 80,
                              ),
                              const Text(
                                'Need Help ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Right Section: Form with connected steps and email input
              Expanded(
                child: Stack(
                  children: [
                    // Background container with two colors
                    if(Responsive.isMobile(context))
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [primaryColor, whiteColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.5, 0.5],
                          ),
                        ),
                      ),

                    // Dynamic Content Based on Step
                    IndexedStack(
                      index: activeStep,
                      children: [
                        // Step 0 Screen: Activation
                        Column(
                          children: [
                            StepperWidget(
                              activeStep: activeStep,
                              store: store,
                              onStepChange: storeProvider.onStepChange,
                            ),
                            const SizedBox(height: defaultHeight),
                            Center(
                              child: Text(
                                'Step 0: Activation Screen',
                                style: TextStyle(fontSize: 24, color: primaryColor),
                              ),
                            ),
                          ],
                        ),

                        // Step 1 Screen: Store Details
                        Column(
                          children: [
                            StepperWidget(
                              activeStep: activeStep,
                              store: store,
                              onStepChange: storeProvider.onStepChange,
                            ),
                            const SizedBox(height: defaultHeight),
                            Center(
                              child: Text(
                                'Step 1: Store Details Screen',
                                style: TextStyle(fontSize: 24, color: primaryColor),
                              ),
                            ),
                          ],
                        ),

                        // Step 2 Screen: Preparing
                        Container(
                          height: height,
                          margin: EdgeInsets.symmetric(
                              horizontal: Responsive.isMobile(context)
                                  ? height * 0.032
                                  : height * 0.12),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Column(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     // Connected steps progress bar
                                //     Row(
                                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //       children: [
                                //         Expanded(
                                //           child: EasyStepper(
                                //             enableStepTapping: false,
                                //             activeStep: activeStep,
                                //             lineStyle: const LineStyle(
                                //               lineLength: 70,
                                //               lineSpace: 0,
                                //               lineType: LineType.normal,
                                //               defaultLineColor: Colors.white,
                                //               finishedLineColor: primaryColor,
                                //             ),
                                //             defaultStepBorderType: BorderType.normal,
                                //             activeStepBorderColor: primaryColor,
                                //             activeStepTextColor: primaryColor,
                                //             finishedStepTextColor: primaryColor,
                                //             unreachedStepBackgroundColor: Colors.white,
                                //             internalPadding: 0,
                                //             showLoadingAnimation: true,
                                //             stepRadius: 10,
                                //             showStepBorder: true,
                                //             steps: [
                                //               EasyStep(
                                //                 customStep: CircleAvatar(
                                //                   radius: 8,
                                //                   backgroundColor: activeStep >= 0 ? store?.primaryColor ?? primaryColor : store?.secondaryColor ?? secondaryColor,
                                //                 ),
                                //                 title: 'Activation',
                                //                 // customTitle: Text(
                                //                 //   "Activation",
                                //                 //   textAlign: TextAlign.center,
                                //                 //   overflow: TextOverflow.ellipsis,
                                //                 //   style: GoogleFonts.poppins(
                                //                 //     fontSize: 12,
                                //                 //   ),
                                //                 // ),
                                //               ),
                                //               EasyStep(
                                //                 customStep: CircleAvatar(
                                //                   radius: 8,
                                //                   backgroundColor:
                                //                   activeStep >= 1 ? store?.primaryColor ?? primaryColor : Colors.white,
                                //                 ),
                                //                 title: 'Store Details',
                                //                 // customTitle: Text(
                                //                 //   "Store Details",
                                //                 //   textAlign: TextAlign.center,
                                //                 //   overflow: TextOverflow.ellipsis,
                                //                 //   style: GoogleFonts.poppins(
                                //                 //     fontSize: 12,
                                //                 //   ),
                                //                 // ),
                                //                 topTitle: true,
                                //               ),
                                //               EasyStep(
                                //                 customStep: CircleAvatar(
                                //                   radius: 8,
                                //                   backgroundColor:
                                //                   activeStep >= 2 ? store?.primaryColor ?? primaryColor : Colors.white,
                                //                 ),
                                //                 title: 'Preparing',
                                //                 // customTitle: Text(
                                //                 //   "Preparing",
                                //                 //   textAlign: TextAlign.center,
                                //                 //   overflow: TextOverflow.ellipsis,
                                //                 //   style: GoogleFonts.poppins(
                                //                 //     fontSize: 12,
                                //                 //   ),
                                //                 // ),
                                //               ),
                                //             ],
                                //             onStepReached: (index) => storeProvider.onStepChange(index),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //
                                //     // if (storeProvider.errorMsg != null)
                                //     //   Text(
                                //     //     storeProvider.errorMsg!,
                                //     //     style: const TextStyle(color: Colors.red),
                                //     //   ),
                                //     // const SizedBox(height: 20),
                                //     // storeProvider.isLoading
                                //     //     ? const CircularProgressIndicator()
                                //     //     : ElevatedButton(
                                //     //   onPressed: () => storeProvider.createStore(),
                                //     //   child: const Text('Activate Store'),
                                //     // ),
                                //   ],
                                // ),
                                StepperWidget(
                                  activeStep: activeStep,
                                  store: store,
                                  onStepChange: storeProvider.onStepChange,
                                ),
                                const SizedBox(height: defaultHeight),
                                // SizedBox(height: height * 0.1),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Let’s',
                                          style: raleWayStyle.copyWith(
                                            fontSize: 25.0,
                                            color: Responsive.isMobile(context) ? whiteColor: blueDarkColor,
                                            fontWeight: FontWeight.normal,
                                          )),
                                      TextSpan(
                                        text: ' Sign In 👇',
                                        style: raleWayStyle.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: Responsive.isMobile(context) ? whiteColor: blueDarkColor,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                Text(
                                  'Hey, Enter your details to get sign in \nto your account.',
                                  style: raleWayStyle.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(height: height * 0.064),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Email',
                                    style: raleWayStyle.copyWith(
                                      fontSize: 12.0,
                                      color: Responsive.isMobile(context) ? whiteColor: blueDarkColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: whiteColor,
                                  ),
                                  child: TextFormField(
                                    style: raleWayStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: blueDarkColor,
                                      fontSize: 12.0,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: const BorderSide(color: Colors.black),
                                      ),
                                      prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(AppIcons.emailIcon),
                                      ),
                                      contentPadding: const EdgeInsets.only(top: 16.0),
                                      hintText: 'Enter Email',
                                      hintStyle: raleWayStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: blueDarkColor.withOpacity(0.5),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.014),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    'Password',
                                    style: raleWayStyle.copyWith(
                                      fontSize: 12.0,
                                      color: Responsive.isMobile(context) ? whiteColor: blueDarkColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6.0),
                                Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: whiteColor,
                                  ),
                                  child: TextFormField(
                                    style: raleWayStyle.copyWith(
                                      fontWeight : FontWeight.w400,
                                      color: blueDarkColor,
                                      fontSize: 12.0,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: const BorderSide(color: Colors.black),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(AppIcons.eyeIcon),
                                      ),
                                      prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(AppIcons.lockIcon),
                                      ),
                                      contentPadding: const EdgeInsets.only(top: 16.0),
                                      hintText: 'Enter Password',
                                      hintStyle: raleWayStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: blueDarkColor.withOpacity(0.5),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.03),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: raleWayStyle.copyWith(
                                        fontSize: 12.0,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.05),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                        },
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Ink(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: defaultWidth, vertical: defaultHeight),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.0),
                                            color: primaryColor,
                                            border: Responsive.isMobile(context) ? Border.all(
                                              color: backgroundColor,
                                            ): null,
                                          ),
                                          child: Text(
                                            'Sign In',
                                            style: GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: whiteColor,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if(Responsive.isMobile(context))
                                      Column(
                                        children: [
                                          Lottie.asset(
                                            'assets/animations/help_bulb_dark.json',
                                            height: 40,
                                            width: 60,
                                          ),
                                          const Text(
                                            'Need Help ?',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),

                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//
// class ActivationScreen extends StatefulWidget {
//   @override
//   _ActivationScreenState createState() => _ActivationScreenState();
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => StoreProvider(),
//       child: ActivationScreen(),
//     );
//   }
// }
//
// class _ActivationScreenState extends State<ActivationScreen> {
//   // final _storeIdController = TextEditingController();
//   // final _purchaseCodeController = TextEditingController();
//   // bool _isLoading = false;
//   // String? _errorMessage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Activate Your Store'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _storeIdController,
//               decoration: InputDecoration(labelText: 'Store ID'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _purchaseCodeController,
//               decoration: InputDecoration(labelText: 'Purchase Code'),
//             ),
//             SizedBox(height: 20),
//             if (_errorMessage != null)
//               Text(
//                 _errorMessage!,
//                 style: TextStyle(color: Colors.red),
//               ),
//             SizedBox(height: 20),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: () => _activateStore(context),
//               child: Text('Activate Store'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
