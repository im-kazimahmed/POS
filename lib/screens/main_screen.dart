import 'package:flutter/material.dart';
import 'package:pos/screens/bills_screen.dart';
import 'package:pos/screens/messages_screen.dart';
import 'package:pos/screens/notifications_screen.dart';
import 'package:pos/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/screens/food_screen.dart';
import 'package:pos/util/responsive.dart';
import '../providers/app_provider.dart';
import '../widgets/dashboard/components/header.dart';
import 'dashboard_screen.dart';
import '../widgets/side_menu_widget.dart';
import '../widgets/cart_widget.dart';


// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   bool isCartOpen = false;
//
//   final List<Widget> pages = [
//     const DashboardScreen(),
//     FoodScreen(),
//     Container(
//       child: Text("Messages Screen"),
//     ),
//     Container(
//       child: Text("Bills Screen"),
//     ),
//     Container(
//       child: Text("Settings Screen"),
//     ),
//     Container(
//       child: Text("Notifications Screen"),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: tertiaryColor,
//       drawer: SideMenuWidget(),
//       body: Stack(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (Responsive.isDesktop(context))
//                 Expanded(
//                   child: SideMenuWidget(),
//                 ),
//               Expanded(
//                 flex: 5,
//                 child: Column(
//                   children: [
//                     const Header(),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: pages[context.read<MenuAppController>().selectedIndex],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           // Cart Panel
//           if (isCartOpen)
//             Positioned(
//               right: 0,
//               top: 0,
//               bottom: 0,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isCartOpen = false;
//                   });
//                 },
//                 child: CartWidget(), // Your cart content
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             isCartOpen = !isCartOpen;
//           });
//         },
//         child: Icon(Icons.shopping_cart),
//       ),
//     );
//   }
// }


class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pages = [
    const DashboardScreen(),
    FoodScreen(),
    const MessagesScreen(),
    const BillsScreen(),
    const SettingsScreen(),
    const NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuAppProvider>(
      builder: (context, controller, child) {
        return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: tertiaryColor,
          drawer: SideMenuWidget(),
          body: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  if(Responsive.isDesktop(context))
                    Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenuWidget(),
                    ),
                  Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: Column(
                      children: [
                        const Header(),
                        // const SizedBox(height: defaultPadding),
                        Expanded(
                          child: SingleChildScrollView(
                            primary: false,
                            child: pages[controller.selectedIndex],
                          ),
                        ),
                        // const Footer(),
                      ],
                    ),
                  ),
                ],
              ),
              // Cart Panel
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: controller.isCartOpened ? 300 : 0,
                  alignment: Alignment.centerRight,
                  color: primaryColor,
                  child: controller.isCartOpened
                      ? const CartWidget()
                      : null,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<MenuAppProvider>().controlCart();
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.shopping_cart),
          ),
        );
      }
    );
  }
}
