import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/data/repositories/user_repo.dart';
import 'package:demo_project/presentation/screens/bottom_navbar_screen.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreenViewModel {

  LoginScreenViewModel();

  // constants
  final _repo = UserRepo();
  final formKey = GlobalKey<FormState>();
  final int _passwordMinLength = 8;

  //variables
  bool _passwordAvailable = false;
  bool _phoneAvailable = false;
  String? _countryCode;
  String? _password;
  String? _phoneNumber;

  
  // providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);

  //================================================================================
  // password field functions
  void onSavedPassword(String? newPass) {
    _password = newPass;
  }

  void onChangedPassword(String? password, WidgetRef ref) {
    if (password == null || password.isEmpty) {
      _passwordAvailable = false;
    } else {
      _passwordAvailable = true;
    }
    ref.read(isEnableSubmit.notifier).state = _passwordAvailable && _phoneAvailable;
  }

  String? validatorPassword(String? password) {
    if (password == null ||
        password.isEmpty ||
        password.length < _passwordMinLength) {
      return SentencesGetter.passwordValidate;
    }
    return null;
  }
  //===================================================================================
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
    ref.read(isEnableSubmit.notifier).state = _passwordAvailable && _phoneAvailable;
  }

  void onSavedCode(String? code) {
    _countryCode = code;
  }

  //================================================================================
  // submit button function
  void onSubmitCliked(WidgetRef ref, context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ref.read(isLoading.notifier).state = true;
      ref.read(isEnableSubmit.notifier).state = false;
      Logger.log('countryCode: $_countryCode phoneNumber: $_phoneNumber password: $_password', 1);
      if(await _repo.login(_countryCode!, _phoneNumber!, _password!)){
        ref.read(isLoading.notifier).state = false;
        ref.read(isEnableSubmit.notifier).state = true;
        //will navigate
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => BottomNavBarScreen()));
      }
      else{
        SnackbarUtil.showSnackbar(context, SentencesGetter.loginFailed);
        ref.read(isLoading.notifier).state = false;
        ref.read(isEnableSubmit.notifier).state = true;
      }
    }
  }
}
