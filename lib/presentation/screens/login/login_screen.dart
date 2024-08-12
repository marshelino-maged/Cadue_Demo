import 'package:demo_project/constants/app_colors.dart';
import 'package:demo_project/constants/app_images.dart';
import 'package:demo_project/constants/app_sentences.dart';
import 'package:demo_project/presentation/widgets/common/main_button.dart';
import 'package:demo_project/presentation/widgets/common/password_field.dart';
import 'package:demo_project/presentation/widgets/common/phone_field.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:demo_project/presentation/screens/forget_passwrod/forget_screen.dart';
import 'package:demo_project/presentation/screens/login/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final LoginScreenViewModel _modelView = LoginScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white255,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Form(
          key: _modelView.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80,),
                Image.asset(
                  AppImages.cadeauLogo,
                  width: 130,
                  height: 70,
                ),
                const SizedBox(height: 20),
                StyledText(
                  AppSentences.loginWelcome,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                StyledText(
                  AppSentences.loginLogIn,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.greyLight,
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) => PhoneField(
                    onSavedCode: _modelView.onSavedCode,
                    onChangedPhone: (phone) {
                      _modelView.onChangedPhone(phone, ref);
                    },
                    onSavedPhone: _modelView.onSavedPhone,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return PasswordField(
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
                    final isEnabled = ref.watch(_modelView.isEnableSubmit);
                    final isLoading = ref.watch(_modelView.isLoading);
                    return MainButton(
                      onPressed: () {
                        _modelView.onSubmitCliked(ref, context);
                      },
                      text: AppSentences.loginButton,
                      isEnabled: isEnabled,
                      isLoading: isLoading,
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      child: StyledText(
                        AppSentences.loginForgetPW,
                        fontSize: 12,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetScreen()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledText(
                      AppSentences.loginDonotHaveAcc,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: StyledText(
                        AppSentences.loginSignUp,
                        fontSize: 14,
                        color: AppColors.orange,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
