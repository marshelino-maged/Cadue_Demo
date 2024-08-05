import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required ProductModel product})
      : image = product.image!,
        title = product.name!,
        priceBefore = product.price!,
        priceAfter = product.priceAfterDiscount!,
        currency = product.currency!.name!;

  final String image;
  final String title;
  final double priceBefore;
  final double priceAfter;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: double.infinity,
              height: constraints.maxWidth,
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 35,
          child: Text(
            title,
            style: GoogleFonts.jost(
                fontSize: 14,
                color: ColorsGetter.black26,
                fontWeight: FontWeight.w400),
            maxLines: 2,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            StyledText('$currency $priceAfter'),
            const SizedBox(
              width: 8,
            ),
            Text('$currency $priceBefore',
                style: GoogleFonts.jost(
                    fontSize: 12,
                    color: const Color.fromRGBO(197, 197, 197, 1),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough)),
          ],
        ),
      ],
    );
  }
}
