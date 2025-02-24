import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pos/providers/app_provider.dart';
import 'package:pos/util/responsive.dart';
import '../../../constant/constants.dart';
import 'dart:developer';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isDesktop(context) ? headerPaddingDesktop: headerPaddingMobile,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu,color: secondaryColor),
              onPressed: context.read<MenuAppProvider>().controlMenu,
            ),
          const SizedBox(width: defaultPadding),
          Consumer<MenuAppProvider>(
            builder: (context, value, child) {
              final List sideBarMenus = value.sideBarMenus.where((menu) => menu["title"] != "Divider").toList();
              int index = value.selectedIndex;
              return Text(
                sideBarMenus[index]['title'],
                style: GoogleFonts.poppins(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          ),
          // const Expanded(
          //   child: SizedBox(
          //     height: 30,
          //     child: SearchField(),
          //   ),
          // ),
          // const Spacer(flex: 2),
          // const ProfileCard()
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: defaultPadding),
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: GoogleFonts.poppins(
          fontSize: 10,
        ),
        fillColor: backgroundColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
