import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/presentation/screens/account/account_view_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends ConsumerWidget {
  AccountScreen({super.key, required this.popBottomNavBar});
  final Function() popBottomNavBar;
  final _viewModel = AccountViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white255,
      body: ref.watch(_viewModel.isLogingOut)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                ListTile(
                  leading: Image.asset(AppImages.exitIcon),
                  tileColor: AppColors.grey239,
                  title: StyledText(AppSentences.logOutButton,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey37),
                  onTap: () {
                    _viewModel.logout(context, popBottomNavBar, ref);
                  },
                ),
              ],
            ),
    );
  }
}
