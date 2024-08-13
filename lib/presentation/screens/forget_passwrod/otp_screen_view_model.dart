import 'dart:async' show Timer;
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/data/repositories/forget_password_repo.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/change_password_screen.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/forget_screen_view_model.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreenViewModel {
  OtpScreenViewModel();

  final _repo = ForgetPasswordRepo();

  //providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);
  final isEnableResend = StateProvider<bool>((ref) => false);
  final resendTimer = StateProvider<int>((ref) => 60);

  //variables
  String _code = '';

  void startTimer(WidgetRef ref) {
    ref.read(isEnableResend.notifier).state = false;
    ref.read(resendTimer.notifier).state = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick <= 60) {
        ref.read(resendTimer.notifier).state = 60 - timer.tick;
      } else {
        ref.read(isEnableResend.notifier).state = true;
        timer.cancel();
      }
    });
  }

  //code field functions
  void onChangedCode(WidgetRef ref) {
    ref.read(isEnableSubmit.notifier).state = false;
  }

  void onDoneCode(String verificationCode, WidgetRef ref) {
    ref.read(isEnableSubmit.notifier).state = true;
    _code = verificationCode;
    Logger.log(_code, 1);
  }

  //on submit button clicked
  Future<void> onSubmitCliked(WidgetRef ref, context) async {
    ref.read(isEnableSubmit.notifier).state = false;
    ref.read(isLoading.notifier).state = true;
    final res = await _repo.verifyOtp(
      ref.read(ForgetScreenViewModel.countryCode),
      ref.read(ForgetScreenViewModel.phoneNumber),
      _code,
    );
    ref.read(isEnableSubmit.notifier).state = true;
    ref.read(isLoading.notifier).state = false;
    if (res) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
        ),
      );
    } else {
      SnackbarUtil.showSnackbar(context, AppSentences.otpError);
    }
  }

  Future<void> resendClicked(WidgetRef ref, context) async {
    final res = await _repo.resetPwOtp(
      ref.read(ForgetScreenViewModel.countryCode),
      ref.read(ForgetScreenViewModel.phoneNumber),
    );
    if (res) {
      SnackbarUtil.showSnackbar(context, AppSentences.resendSuccess);
      startTimer(ref);
    }
  }
}
