import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/presentation/widgets/common/back_arrow.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/common/password_field.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/change_passwrod_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen(
      {super.key,
      required countryCode,
      required phoneNumber,})
      : _viewModel = ChangePasswordViewModel(
            countryCode: countryCode,
            phoneNumber: phoneNumber,);
  final ChangePasswordViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrow(),
        backgroundColor: ColorsGetter.white255,
      ),
      backgroundColor: ColorsGetter.white255,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  ImagesGetter.lock,
                  width: 66,
                  height: 76,
                ),
                const SizedBox(height: 20),
                StyledText(
                  SentencesGetter.setNewPassword,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 100),
                Consumer(
                  builder: (context, ref, child) => PasswordField(
                      hint: SentencesGetter.passwordHintForget,
                      label: SentencesGetter.passwordLabelForget,
                      onSaved: _viewModel.firstSaved,
                      validator: _viewModel.firstValidator,
                      onChanged: (pass) {
                        _viewModel.firstChanged(pass, ref);
                      }),
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) => PasswordField(
                      hint: SentencesGetter.passwordHintForget,
                      label: SentencesGetter.passwordLabelForget,
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
                      text: SentencesGetter.next,
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
