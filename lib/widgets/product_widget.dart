import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';
import 'package:pos/util/responsive.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final int quantity;
  final Function onAdd;
  final Function onRemove;
  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 0,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: Responsive.isDesktop(context) ? size.width / 4 :
        (Responsive.isTablet(context) ? size.width / 3.5 : size.width / 1),
        height: 160,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 15,
              left: 30,
              child: Container(
                width: Responsive.isDesktop(context) ? size.width :
                (Responsive.isTablet(context) ? size.width / 3.5: size.width / 1.5),
                // height: 114,
                height: Responsive.isDesktop(context) ? 114 : 100,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Row(
                  children: <Widget>[
                    if(Responsive.isDesktop(context))
                      const SizedBox(width: 130)
                    else
                      const SizedBox(width: 100),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: GoogleFonts.poppins(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    !price.toString().contains("\$") ? "\$${price.toString()}": price.toString(),
                                    style: GoogleFonts.poppins(),
                                  ),
                                ],
                              ),
                            ),
                            // Quantity Controls
                            Expanded(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => onRemove(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(defaultRadius),
                                      ),
                                      padding: const EdgeInsets.all(3.0),
                                      child: Icon(Icons.remove, color: quantity == 0 ? tertiaryColor: primaryColor),
                                    ),
                                  ),
                                  const SizedBox(width: defaultHeight),
                                  Text(
                                    quantity.toString(),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: defaultHeight),
                                  InkWell(
                                    onTap: () => onAdd(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(defaultRadius),
                                      ),
                                      padding: const EdgeInsets.all(3.0),
                                      child: const Icon(Icons.add, color: primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Responsive.isDesktop(context) ? 150 : 130,
              height: Responsive.isDesktop(context) ? 150 : 130,
              // height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    offset: const Offset(-3, 5),
                    blurRadius: 4,
                    spreadRadius: -18,
                  ),
                ],
                image: DecorationImage(image:
                AssetImage(
                  image,
                ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
