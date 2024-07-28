import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/data/repositories/user_repo.dart';
import 'package:demo_project/presentation/screens/homa_screen.dart';
import 'package:demo_project/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/phone_number.dart';

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
  final isHiddenPassword = StateProvider<bool>((ref) => true);
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);

  //================================================================================
  // password field functions
  void togglePasswordVisibility(WidgetRef ref) {
    ref.read(isHiddenPassword.notifier).state =
        !ref.read(isHiddenPassword.notifier).state;
  }

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
  void onSavedPhone(PhoneNumber? phone) {
    _countryCode = phone!.countryCode.toString();
    _phoneNumber = phone.number;
  }

  void onChangedPhone(PhoneNumber? phone, WidgetRef ref) {
    if (phone == null || phone.number.isEmpty) {
      _phoneAvailable = false;
    } else {
      _phoneAvailable = true;
    }
    ref.read(isEnableSubmit.notifier).state = _passwordAvailable && _phoneAvailable;
  }

  //================================================================================
  // submit button function
  void onSubmitCliked(WidgetRef ref, context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      ref.read(isLoading.notifier).state = true;
      ref.read(isEnableSubmit.notifier).state = false;
      if(await _repo.login(_countryCode!, _phoneNumber!, _password!)){
        ref.read(isLoading.notifier).state = false;
        ref.read(isEnableSubmit.notifier).state = true;
        //will navigate
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomeScreen()));
      }
      else{
        SnackbarUtil.showSnackbar(context, SentencesGetter.loginFailed);
        ref.read(isLoading.notifier).state = false;
        ref.read(isEnableSubmit.notifier).state = true;
      }
    }
  }
}
