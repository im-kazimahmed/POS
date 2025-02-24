import 'package:flutter/material.dart';

import '../../../constant/constants.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      height: 50,
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
