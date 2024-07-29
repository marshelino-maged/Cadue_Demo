import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/presentation/common_widgets/main_button.dart';
import 'package:demo_project/presentation/common_widgets/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/otp_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phoneNumber, required this.countryCode});
  final String phoneNumber;
  final String countryCode;
  final _viewModel = OtpScreenViewModel();
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
                  ImagesGetter.otp,
                  width: 150,
                  height: 132,
                ),
                const SizedBox(height: 30),
                StyledText(
                  SentencesGetter.otpTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 20),
                StyledText(
                  SentencesGetter.otpSubtitle1,
                ),
                StyledText(
                  SentencesGetter.otpSubtitle2,
                ),
                const SizedBox(height: 20),
                StyledText(
                  "$countryCode$phoneNumber",
                  fontSize: 22,
                ),
                const SizedBox(height: 100),
                
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