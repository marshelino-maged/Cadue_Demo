import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/constants/text_style_getter.dart';
import 'package:demo_project/presentation/common_widgets/main_button.dart';
import 'package:demo_project/presentation/common_widgets/password_field.dart';
import 'package:demo_project/presentation/common_widgets/phone_field.dart';
import 'package:demo_project/presentation/common_widgets/text_title.dart';
import 'package:demo_project/presentation/screens/login_screen_model_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final LoginScreenModelView _modelView = LoginScreenModelView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGetter.white255,
      // body: SafeArea(
      //   child: SingleChildScrollView(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Form(
          key: _modelView.formKey,
          child: Column(
            children: [
              Image.asset(
                ImagesGetter.cadeauLogo,
                width: 130,
                height: 70,
              ),
              const SizedBox(height: 20),
              TextTitle(SentencesGetter.loginWelcome),
              Text(
                SentencesGetter.loginLogIn,
                style: TextStyleGetter.titleGrey,
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) => PhoneField(
                  onSaved: (phone) {
                    _modelView.onSavedPhone(phone);
                  },
                  onChanged: (phone) {
                    _modelView.onChangedPhone(phone, ref);
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final isHiddenPassword =
                      ref.watch(_modelView.isHiddenPassword);
                  return PasswordField(
                    isHiddenPassword: isHiddenPassword,
                    onPressed: () {
                      _modelView.togglePasswordVisibility(ref);
                    },
                    onSaved: _modelView.onSavedPassword,
                    validator: _modelView.validatorPassword,
                    onChanged: (password) {
                      _modelView.onChangedPassword(password, ref);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final bool isEnabled = ref.watch(_modelView.isEnableSubmit);
                  return MainButton(
                      onPressed: _modelView.onSubmitCliked,
                      text: SentencesGetter.loginButton,
                      isEnabled: isEnabled);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    child: Text(
                      SentencesGetter.loginForgetPW,
                      style: TextStyleGetter.forgetPW,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    SentencesGetter.loginDonotHaveAcc,
                    style: TextStyleGetter.donotHaveAccount,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      SentencesGetter.loginSignUp,
                      style: TextStyleGetter.loginSignUp,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
