import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/presentation/screens/occasions/occasions_view_model.dart';
import 'package:demo_project/presentation/screens/products/products_screen.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/widgets/occasion/occasion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OccasionsScreen extends ConsumerStatefulWidget {
  const OccasionsScreen({super.key});

  @override
  ConsumerState<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState extends ConsumerState<OccasionsScreen> {
  final _viewModel = OccasionsViewModel();
  final _listController = ScrollController();
  @override
  void initState() {
    super.initState();
    _viewModel.loadMoreData(ref);
    _listController.addListener(() {
      if (_listController.position.pixels ==
          _listController.position.maxScrollExtent) {
        _viewModel.loadMoreData(ref);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white255,
      appBar: AppBar(
        backgroundColor: AppColors.white255,
        title: StyledText(
          AppSentences.occasionsTitle,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppImages.notificationIcon),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer(
          builder: (context, ref, child) {
            final occasions = ref.watch(_viewModel.occasions);
            final hasNext = ref.watch(_viewModel.hasNext);
            return ListView.builder(
              controller: _listController,
              itemCount: occasions.length + (hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                return (index == occasions.length && hasNext)
                    ? const Center(
                        child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ))
                    : OccasionItem(
                        occasion: occasions[index],
                        onOccasionClicked: () {
                          _viewModel.setOccasion(ref, occasions[index]);
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: ProductsScreen(),
                            withNavBar: true,
                          );
                        },
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
