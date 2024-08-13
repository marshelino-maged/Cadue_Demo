import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/presentation/screens/products/details_view_model.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/product/details_column.dart';
import 'package:demo_project/presentation/widgets/product/image_slider.dart';
import 'package:demo_project/presentation/widgets/product/styled_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  final _viewModel = DetailsViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadData(ref);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(_viewModel.isLoading);
    final details = ref.watch(_viewModel.details);
    return Scaffold(
      backgroundColor: AppColors.white255,
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
                            images: details.media!.map((e) => e.url!).toList(),
                          ),
                          Positioned(
                            top: 70,
                            left: 20,
                            child: StyledIconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            right: 20,
                            child: StyledIconButton(
                              onPressed: () {},
                              icon: Image.asset(AppImages.shareIcon),
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
                          backgroundColor: AppColors.white255,
                          foregroundColor: AppColors.black26,
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
  }
}
