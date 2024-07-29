import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/presentation/common_widgets/main_button.dart';
import 'package:demo_project/presentation/common_widgets/phone_field.dart';
import 'package:demo_project/presentation/common_widgets/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/forget_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final ForgetScreenViewModel _viewModel = ForgetScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsGetter.white255,),
      backgroundColor: ColorsGetter.white255,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Form(
          key: _viewModel.formkey,
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
                  SentencesGetter.forgetTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                StyledText(
                  SentencesGetter.forgetSubtitle1,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorsGetter.grey146,
                ),
                StyledText(
                  SentencesGetter.forgetSubtitle2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorsGetter.grey146,
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
