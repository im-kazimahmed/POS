import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/constant/constants.dart';

class CartItemWidget extends StatelessWidget {
  final String name;
  final String price;
  final String quantity;
  final Function onAdd;
  final Function onRemove;
  const CartItemWidget({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: grayColor,
        borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
      ),
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              color: textHeadingColor,
            ),
          ),
          Text(
            price,
            style: GoogleFonts.poppins(
              color: grayLightOpacityColor,
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => onRemove(),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryGrayColor,
                    borderRadius: BorderRadius.circular(defaultRadius - 5),
                  ),
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.remove,
                    color: tertiaryColor,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: defaultHeight),
              Text(
                quantity.toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: tertiaryColor,
                ),
              ),
              const SizedBox(width: defaultHeight),
              InkWell(
                onTap: () => onAdd(),
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryGrayColor,
                    borderRadius: BorderRadius.circular(defaultRadius - 5),
                  ),
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.add,
                    color: tertiaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
