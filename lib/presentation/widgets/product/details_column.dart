import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/data/models/details_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key, required this.details});
  final DetailsModel details;
  @override
  Widget build(BuildContext context) {
    // var currency = 'SAR';
    // String company = 'Zara';
    // String productName = 'warda fagera awii mtr4ma';
    String dimesions = '24 * 10 *12 cm';
    // var priceAfter = 230;
    // var priceBefore = 380;
    // final double rating = 4.3;
    // final int numberOfRates = 68;
    // final String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    //         'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    //         'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    //         'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
    //         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    //         'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    //         'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    //         'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
    //         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    //         'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    //         'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    //         'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
    //         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    //         'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
    //         'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    //         'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ';
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
              color: ColorsGetter.greyLight,
            ),
            const SizedBox(
              width: 5,
            ),
            StyledText(details.store!.name!,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorsGetter.lightBlue,
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
              StarRating(rating: details.avgRate!,mainAxisAlignment: MainAxisAlignment.start,color: ColorsGetter.orange233,),
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
                color: ColorsGetter.black66,
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
                  color: ColorsGetter.grey197,
                  decoration: TextDecoration.lineThrough),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: ColorsGetter.grey236,
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
            color: ColorsGetter.grey82,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
