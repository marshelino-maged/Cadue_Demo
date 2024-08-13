import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/presentation/widgets/common/back_arrow.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/common/password_field.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/change_passwrod_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  
  final _viewModel = ChangePasswordViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrow(),
        backgroundColor: AppColors.white255,
      ),
      backgroundColor: AppColors.white255,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _viewModel.formKey,
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
                  AppSentences.setNewPassword,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 100),
                Consumer(
                  builder: (context, ref, child) => PasswordField(
                      hint: AppSentences.passwordHintForget,
                      label: AppSentences.passwordLabelForget,
                      onSaved: _viewModel.firstSaved,
                      validator: _viewModel.firstValidator,
                      onChanged: (pass) {
                        _viewModel.firstChanged(pass, ref);
                      }),
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) => PasswordField(
                      hint: AppSentences.passwordHintForget,
                      label: AppSentences.passwordLabelForget,
                      onSaved: _viewModel.secondSaved,
                      validator: _viewModel.secondValidator,
                      onChanged: (pass) {
                        _viewModel.secondChanged(pass, ref);
                      }),
                ),
                const SizedBox(
                  height: 40,
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
