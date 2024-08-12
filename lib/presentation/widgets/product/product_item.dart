import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/data/models/product_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';

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
          child: StyledText(
            title,
            fontSize: 14,    
            fontWeight: FontWeight.w400,
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
              width: 2,
            ),
            StyledText('$currency $priceBefore',
                fontSize: 12,
                color: AppColors.grey197,
                decoration: TextDecoration.lineThrough),
          ],
        ),
      ],
    );
  }
}
