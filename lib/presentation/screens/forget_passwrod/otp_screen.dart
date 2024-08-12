import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/presentation/widgets/common/back_arrow.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/otp_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerStatefulWidget {
  OtpScreen({super.key, required this.phoneNumber, required this.countryCode})
      : _viewModel = OtpScreenViewModel(phoneNumber, countryCode);
  final String phoneNumber;
  final String countryCode;
  final OtpScreenViewModel _viewModel;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  @override
  void initState() {
    super.initState();
    widget._viewModel.startTimer(ref);
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                AppImages.otp,
                width: 150,
                height: 132,
              ),
              const SizedBox(height: 30),
              StyledText(
                AppSentences.otpTitle,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 20),
              StyledText(
                AppSentences.otpSubtitle1,
              ),
              StyledText(
                AppSentences.otpSubtitle2,
              ),
              const SizedBox(height: 20),
              StyledText(
                "${widget.countryCode}${widget.phoneNumber}",
                fontSize: 22,
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  return OtpTextField(
                    numberOfFields: 6,
                    borderColor: AppColors.black26,
                    borderWidth: 1,
                    fieldHeight: 44,
                    fieldWidth: 44,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      widget._viewModel.onChangedCode(ref);
                    },
                    onSubmit: (String verificationCode) {
                      widget._viewModel.onDoneCode(verificationCode, ref);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final bool isEnabled =
                      ref.watch(widget._viewModel.isEnableResend);
                  return TextButton(
                    onPressed: isEnabled
                        ? () {widget._viewModel.resendClicked(ref, context);}
                        : null,
                    child: StyledText(
                      AppSentences.reSendCode,
                      color: isEnabled
                          ? AppColors.black26
                          : AppColors
                              .grey174,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer(
                builder: (context, ref, child) {
                  final time = ref.watch(widget._viewModel.resendTimer);
                  final isEnable = ref.watch(widget._viewModel.isEnableResend);
                  return StyledText(
                    isEnable ? '' : '${time}s',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  );
                },
              ),
              const SizedBox(height: 80),
              Consumer(
                builder: (context, ref, child) {
                  final bool isEnabled =
                      ref.watch(widget._viewModel.isEnableSubmit);
                  final bool isLoading = ref.watch(widget._viewModel.isLoading);
                  return MainButton(
                    onPressed: () {
                      widget._viewModel.onSubmitCliked(ref, context);
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
    );
  }
}
