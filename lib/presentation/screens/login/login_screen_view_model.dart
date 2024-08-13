import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/data/models/user_model.dart';
import 'package:demo_project/data/repositories/user_repo.dart';
import 'package:demo_project/presentation/screens/bottom_navbar_screen.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreenViewModel {
  LoginScreenViewModel();

  // constants
  final _repo = UserRepo();
  final formKey = GlobalKey<FormState>();
  final _passwordMinLength = 8;

  //variables
  bool _passwordAvailable = false;
  bool _phoneAvailable = false;
  String? _countryCode;
  String? _password;
  String? _phoneNumber;

  // providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);
  final user = StateProvider<UserModel?>((ref) => null);

  //================================================================================
  // password field functions
  void onSavedPassword(String? newPass) {
    _password = newPass;
  }

  void onChangedPassword(String? password, WidgetRef ref) {
    _passwordAvailable = !(password == null || password.isEmpty);
    ref.read(isEnableSubmit.notifier).state =
        _passwordAvailable && _phoneAvailable;
  }

  String? validatorPassword(String? password) {
    return (password == null ||
            password.isEmpty ||
            password.length < _passwordMinLength)
        ? AppSentences.passwordValidate
        : null;
  }

  //===================================================================================
  // phone field functions
  void onSavedPhone(String? phone) {
    _phoneNumber = phone;
  }

  void onChangedPhone(String? phone, WidgetRef ref) {
    _phoneAvailable = !(phone == null || phone.isEmpty);
    ref.read(isEnableSubmit.notifier).state =
        _passwordAvailable && _phoneAvailable;
  }

  void onSavedCode(String? code) {
    _countryCode = code;
  }

  //================================================================================
  // submit button function
  Future<void> onSubmitCliked(WidgetRef ref, context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ref.read(isLoading.notifier).state = true;
      ref.read(isEnableSubmit.notifier).state = false;
      final user = await _repo.login(_countryCode!, _phoneNumber!, _password!);
      if (user != null) {
        // save user and navigate
        ref.read(this.user.notifier).state = user;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const BottomNavBarScreen()));
      } else {
        SnackbarUtil.showSnackbar(context, AppSentences.loginFailed);
      }
      ref.read(isLoading.notifier).state = false;
      ref.read(isEnableSubmit.notifier).state = true;
    }
  }
}
