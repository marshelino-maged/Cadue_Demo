import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/data/repositories/forget_password_repo.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/otp_screen.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetScreenViewModel {
  ForgetScreenViewModel();

  //constants
  final _formkey = GlobalKey<FormState>();
  final _repo = ForgetPasswordRepo();

  //getters
  GlobalKey<FormState> get formkey => _formkey;

  //variables
  bool _phoneAvailable = false;

  //providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);
  static final countryCode = StateProvider<String>((ref) => '');
  static final phoneNumber = StateProvider<String>((ref) => '');

  // phone field functions
  void onSavedPhone(String? phone, WidgetRef ref) {
    ref.read(phoneNumber.notifier).state = phone!;
  }

  void onChangedPhone(String? phone, WidgetRef ref) {
    _phoneAvailable = !(phone == null || phone.isEmpty);
    ref.read(isEnableSubmit.notifier).state = _phoneAvailable;
  }

  void onSavedCode(String? code, WidgetRef ref) {
    ref.read(countryCode.notifier).state = code!;
  }

  //===================================================================================
  // submit button function
  void onSubmitCliked(WidgetRef ref, context) async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      ref.read(isLoading.notifier).state = true;
      ref.read(isEnableSubmit.notifier).state = false;
      final result =
          await _repo.resetPwOtp(ref.read(countryCode), ref.read(phoneNumber));
      ref.read(isLoading.notifier).state = false;
      ref.read(isEnableSubmit.notifier).state = true;
      if (result) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OtpScreen()));
      } else {
        SnackbarUtil.showSnackbar(context, AppSentences.accountNotExist);
      }
    }
  }
}
