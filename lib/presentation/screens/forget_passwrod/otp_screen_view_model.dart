import 'dart:async' show Timer;

import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/data/repositories/forget_password_repo.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/change_password_screen.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreenViewModel {
  OtpScreenViewModel(this._phoneNumber, this._countryCode);

  final _repo = ForgetPasswordRepo();
  final String _phoneNumber;
  final String _countryCode;

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
        // Logger.log(ref.read(resendTimer.notifier).state.toString(), 0);
        ref.read(resendTimer.notifier).state = 60 - timer.tick;
      } else {
        ref.read(isEnableResend.notifier).state = true;
        timer.cancel();
      }
    });
  }

  //code field functions
  void onChangedCode(String codeChar, WidgetRef ref) {
    ref.read(isEnableSubmit.notifier).state = false;
  }

  void onDoneCode(String verificationCode, WidgetRef ref) {
    ref.read(isEnableSubmit.notifier).state = true;
    _code = verificationCode;
    Logger.log(_code, 1);
  }

  //on submit button clicked
  void onSubmitCliked(WidgetRef ref, context) async {
    ref.read(isEnableSubmit.notifier).state = false;
    ref.read(isLoading.notifier).state = true;
    final res = await _repo.verifyOtp(_countryCode, _phoneNumber, _code);
    ref.read(isEnableSubmit.notifier).state = true;
    ref.read(isLoading.notifier).state = false;
    if (res) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(
                countryCode: _countryCode,
                phoneNumber: _phoneNumber,
              )));
    } else {
      SnackbarUtil.showSnackbar(context, SentencesGetter.otpError);
    }
  }

  void resendClicked(WidgetRef ref, context) async {
    final res = await _repo.resetPwOtp(_countryCode, _phoneNumber);
    if (res) {
      SnackbarUtil.showSnackbar(context, SentencesGetter.resendSuccess);
      startTimer(ref);
    }
  }
}
