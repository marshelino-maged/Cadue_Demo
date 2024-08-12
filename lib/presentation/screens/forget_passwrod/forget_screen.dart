import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/presentation/widgets/common/back_arrow.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/common/phone_field.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/forget_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final ForgetScreenViewModel _viewModel = ForgetScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrow(),
        backgroundColor: AppColors.white255,
      ),
      backgroundColor: AppColors.white255,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Form(
          key: _viewModel.formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppImages.lock,
                  width: 66,
                  height: 76,
                ),
                const SizedBox(height: 20),
                StyledText(
                  AppSentences.forgetTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10,),
                StyledText(
                  AppSentences.forgetSubtitle1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey146,
                ),
                StyledText(
                  AppSentences.forgetSubtitle2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey146,
                ),
                const SizedBox(height: 100),
                Consumer(
                  builder: (context, ref, child) => PhoneField(
                    onSavedCode: _viewModel.onSavedCode,
                    onChangedPhone: (phone) {
                      _viewModel.onChangedPhone(phone, ref);
                    },
                    onSavedPhone: _viewModel.onSavedPhone,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final bool isEnabled = ref.watch(_viewModel.isEnableSubmit);
                    final bool isLoading = ref.watch(_viewModel.isLoading);
                    return MainButton(
                      onPressed: () {
                        _viewModel.onSubmitCliked(ref, context);
                      },
                      text: AppSentences.next,
                      isEnabled: isEnabled,
                      isLoading: isLoading,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
