import 'dart:developer';

import 'package:countries_world_map/components/canvas/shapes/shape.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/providers/app_provider.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuAppProvider>(
      builder: (context, value, child) {
        return Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          backgroundColor: secondaryColor,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                padding: const EdgeInsets.all(sideMenuLogoPadding),
                child: Text(
                  "GodDish!",
                  style: GoogleFonts.pacifico(
                    color: textHeadingColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                // child: DrawerHeader(
                //   child: Image.asset(
                //     "assets/images/header_logo.png",
                //   ),
                // ),
              ),
              // Container(
              //   color: primaryColor,
              //   child: DrawerListTile(
              //     title: "Dashboard",
              //     press: () {},
              //     textColor: textHeadingColor,
              //   ),
              // ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: context.read<MenuAppProvider>().sideBarMenus.length,
                itemBuilder: (context, index) {
                  int selectedIndex = context.read<MenuAppProvider>().selectedIndex;
                  String title = context.read<MenuAppProvider>().sideBarMenus[index]['title'];
                  int route = context.read<MenuAppProvider>().sideBarMenus[index]['route'];
                  if(title == "Divider") {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 1.2,
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        color: route == selectedIndex ? primaryColor: null,
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: DrawerListTile(
                        title: title,
                        press: () {
                          context.read<MenuAppProvider>().onIndexChange(route);
                        },
                        textColor: route == selectedIndex ? textHeadingColor: grayTextColor,
                      ),
                    );
                  }
                },
              )
              // DrawerListTile(
              //   title: "Users Management",
              //   press: () {
              //     context.read<MenuAppController>().onIndexChange(1);
              //   },
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Artist Management",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Schedules Management",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Channel Management",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Categories Management",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Payments Methods",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Packages & Subscription",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "App Configuration",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Ads Configuration",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "One Signal Configurations",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "OTP Twilio Settings",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Chart Control",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Add DJ Party",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
              // DrawerListTile(
              //   title: "Employee Roles",
              //   press: () {},
              //   textColor: grayTextColor,
              // ),
            ],
          ),
        );
      }
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.textColor,
  });

  final String title;
  final VoidCallback press;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
      ),
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
