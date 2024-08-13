import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/data/repositories/forget_password_repo.dart';
import 'package:demo_project/presentation/screens/bottom_navbar_screen.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/forget_screen_view_model.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordViewModel {
  ChangePasswordViewModel();

  // constants
  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final _repo = ForgetPasswordRepo();

  //providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);

  //variables
  String _firstPass = '';
  String _secondPass = '';

  //New Password field functions
  void firstChanged(String? value, WidgetRef ref) {
    _firstPass = value ?? '';
    ref.read(isEnableSubmit.notifier).state =
        _firstPass.isNotEmpty && _secondPass.isNotEmpty;
  }

  String? firstValidator(String? value) {
    if (value == null || value.length < 8) {
      return AppSentences.firstFieldValidate;
    }
    return null;
  }

  void firstSaved(String? value) {
    _firstPass = value!;
  }

  //Confirmation field functions
  void secondChanged(String? value, WidgetRef ref) {
    _secondPass = value ?? '';
    ref.read(isEnableSubmit.notifier).state =
        _firstPass.isNotEmpty && _secondPass.isNotEmpty;
  }

  String? secondValidator(String? value) {
    if (value == null || _secondPass != _firstPass) {
      return AppSentences.secondFieldValidate;
    }
    return null;
  }

  void secondSaved(String? value) {
    _secondPass = value!;
  }

  //submit button function
  void onSubmitCliked(WidgetRef ref, context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      ref.read(isLoading.notifier).state = true;
      ref.read(isEnableSubmit.notifier).state = false;

      final res = await _repo.resetPassword(
        ref.read(ForgetScreenViewModel.countryCode),
        ref.read(ForgetScreenViewModel.phoneNumber),
        _firstPass,
        _secondPass,
      );

      ref.read(isLoading.notifier).state = false;
      ref.read(isEnableSubmit.notifier).state = true;

      if (res) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomNavBarScreen()));
      } else {
        SnackbarUtil.showSnackbar(context, AppSentences.resetPwError);
      }
    }
  }
}
