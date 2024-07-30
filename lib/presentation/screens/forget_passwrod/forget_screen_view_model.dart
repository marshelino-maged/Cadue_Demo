import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/data/repositories/forget_password_repo.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/otp_screen.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetScreenViewModel {
  ForgetScreenViewModel();

  //constants
  final formkey = GlobalKey<FormState>();
  final _repo = ForgetPasswordRepo();

  //variables
  bool _phoneAvailable = false;
  String? _countryCode;
  String? _phoneNumber;

  //providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);

  // phone field functions
  void onSavedPhone(String? phone) {
    _phoneNumber = phone;
  }

  void onChangedPhone(String? phone, WidgetRef ref) {
    if (phone == null || phone.isEmpty) {
      _phoneAvailable = false;
    } else {
      _phoneAvailable = true;
    }
    ref.read(isEnableSubmit.notifier).state = _phoneAvailable;
  }

  void onSavedCode(String? code) {
    _countryCode = code;
  }

  //===================================================================================
  // submit button function
  void onSubmitCliked(WidgetRef ref, context) async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      ref.read(isLoading.notifier).state = true;
      ref.read(isEnableSubmit.notifier).state = false;
      final result = await _repo.resetPwOtp(_countryCode!, _phoneNumber!);
      ref.read(isLoading.notifier).state = false;
      ref.read(isEnableSubmit.notifier).state = true;
      if (result) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => OtpScreen(
                  phoneNumber: _phoneNumber!,
                  countryCode: _countryCode!,
                )));
      } else {
        SnackbarUtil.showSnackbar(context, SentencesGetter.accountNotExist);
      }
    }
  }
}
