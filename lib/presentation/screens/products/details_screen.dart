import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/presentation/screens/products/details_view_model.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/product/details_column.dart';
import 'package:demo_project/presentation/widgets/product/image_slider.dart';
import 'package:demo_project/presentation/widgets/product/styled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final int productId;

  DetailsScreen({super.key, required this.productId})
      : _viewModel = DetailsViewModel(productId);
  final DetailsViewModel _viewModel;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  // final String company = 'Zara';

  // final String productName = 'warda fagera awii mtr4ma';

  // final String dimesions = '24 * 10 *12 cm';

  // final double priceBefore = 380;

  // final double priceAfter = 230;

  // final String currency = 'SAR';

  // final List<String> images = [
  //   "https://cadaeu.s3.eu-central-1.amazonaws.com/development/GJiYFHTT4-b0smxl94ef5A_1722428310.png",
  //   "https://cadaeu.s3.eu-central-1.amazonaws.com/development/GJiYFHTT4-b0smxl94ef5A_1722428310.png",
  //   "https://cadaeu.s3.eu-central-1.amazonaws.com/development/GJiYFHTT4-b0smxl94ef5A_1722428310.png"
  // ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      widget._viewModel.init(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isLoading = ref.watch(widget._viewModel.isLoading);
        final details = ref.watch(widget._viewModel.details);
        return Scaffold(
          backgroundColor: ColorsGetter.white255,
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ImageSlider(
                                images:
                                    details.media!.map((e) => e.url!).toList(),
                              ),
                              Positioned(
                                top: 70,
                                left: 20,
                                child: StyledIconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  iconPath: ImagesGetter.backButton,
                                ),
                              ),
                              Positioned(
                                top: 70,
                                right: 20,
                                child: StyledIconButton(
                                  onPressed: () {},
                                  iconPath: ImagesGetter.shareIcon,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DetailsColumn(details: details),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: MainButton(
                              onPressed: () {},
                              text: '2240 SR',
                              isEnabled: true,
                              backgroundColor: ColorsGetter.white255,
                              foregroundColor: ColorsGetter.black26,
                              isBordered: true,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: MainButton(
                              onPressed: () {},
                              text: 'Add To Cart',
                              isEnabled: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
