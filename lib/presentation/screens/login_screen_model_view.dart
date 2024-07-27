import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginScreenModelView {

  LoginScreenModelView();


  // constants
  final formKey = GlobalKey<FormState>();
  final int _passwordMinLength = 8;

  //variables
  bool _passwordAvailable = false;
  bool _phoneAvailable = false;
  String? _password;
  String? _phoneNumber;

  
  // providers
  var isHiddenPassword = StateProvider<bool>((ref) => true);
  var isEnableSubmit = StateProvider<bool>((ref) => false);

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


  // phone field functions
  void onSavedPhone(PhoneNumber? phone) {
    _phoneNumber = phone!.completeNumber.toString();
  }

  void onChangedPhone(PhoneNumber? phone, WidgetRef ref) {
    if (phone == null || phone.number.isEmpty) {
      _phoneAvailable = false;
    } else {
      _phoneAvailable = true;
    }
    ref.read(isEnableSubmit.notifier).state = _passwordAvailable && _phoneAvailable;
  }

  // submit button function
  void onSubmitCliked() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Logger.log('phone: $_phoneNumber, password: $_password', 1);
      return;
    }
    Logger.log('Form is not valid', -1);
  }
}
