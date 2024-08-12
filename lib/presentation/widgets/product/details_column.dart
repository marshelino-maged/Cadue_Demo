import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key, required this.details});
  final DetailsModel details;
  @override
  Widget build(BuildContext context) {
    String dimesions = '24 * 10 *12 cm';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            StyledText(
              'More from',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.greyLight,
            ),
            const SizedBox(
              width: 5,
            ),
            StyledText(details.store!.name!,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.lightBlue,
                decoration: TextDecoration.underline),
          ]),
          const SizedBox(
            height: 10,
          ),
          StyledText(
            details.name!,
            fontSize: 16,
          ),
          const SizedBox(
            height: 10,
          ),
          StyledText(
            dimesions,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              StarRating(rating: details.avgRate!,mainAxisAlignment: MainAxisAlignment.start,color: AppColors.orange233,),
              const SizedBox(
                width: 5,
              ),
              StyledText(
                '${details.avgRate!}',
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                width: 5,
              ),
              StyledText(
                ' ( ${details.reviewsCount.toString()} ratings )',
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: AppColors.black66,
                decoration: TextDecoration.underline,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              StyledText(
                '${details.currency!.lookupKey} ${details.priceAfterDiscount}',
                fontSize: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              StyledText('${details.currency!.lookupKey} ${details.price}',
                  fontSize: 12,
                  color: AppColors.grey197,
                  decoration: TextDecoration.lineThrough),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: AppColors.grey236,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          const StyledText(
            'Description',
          ),
          const SizedBox(
            height: 10,
          ),
          StyledText(
            details.description!,
            fontSize: 14,
            color: AppColors.grey82,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
