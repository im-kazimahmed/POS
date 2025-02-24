import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/constants.dart';
import '../../../model/storage.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: info.backgroundColors ?? [
            primaryColor,
            primaryColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                InkWell(
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                  // },
                  child: FittedBox(
                    child: Text(
                      "${info.numbers}k",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: info.numberColor,
                        fontSize: 22
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    info.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: info.titleColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: info.color!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: SvgPicture.asset(
              info.svgSrc!,
              colorFilter: ColorFilter.mode(
                info.color ?? Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}