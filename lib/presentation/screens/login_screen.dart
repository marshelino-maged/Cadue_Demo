import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/constants/text_style_getter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var shown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGetter.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesGetter.cadeauLogo,
              width: 130,
              height: 70,
            ),
            const SizedBox(height: 20),
            Text(
              SentencesGetter.loginWelcome,
              style: TextStyleGetter.titleBlack,
            ),
            Text(
              SentencesGetter.loginLogIn,
              style: TextStyleGetter.titleGrey,
            ),
            const SizedBox(height: 20),
            Form(
              child: Column(children: [
                IntlPhoneField(
                  decoration: InputDecoration(
                    hintText: '0124145891',
                    hintStyle: TextStyleGetter.inputFormHint,
                    labelText: 'Phone Number',
                    labelStyle: TextStyleGetter.inputForm,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                  initialCountryCode: 'EG', // Default country code
                  onChanged: (phone) {
                    print(phone
                        .completeNumber); // Full phone number with country code
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter you password here ',
                    hintStyle: TextStyleGetter.inputFormHint,
                    labelText: 'Password',
                    labelStyle: TextStyleGetter.inputForm,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: IconButton(
                      icon: shown
                          ? Icon(
                              Icons.remove_red_eye,
                              size: 17.5,
                              color: ColorsGetter.inputFormHint,
                            )
                          : Image.asset(ImagesGetter.eyeIcon),
                      // icon: Image.asset(ImagesGetter.eyeIcon),
                      onPressed: () {
                        setState(() {
                          shown = !shown;
                        });
                      },
                    ),
                  ),
                  obscureText: shown,
                  obscuringCharacter: '*',
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: ColorsGetter.mainButtonColor,
                  foregroundColor: ColorsGetter.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  'Log in',
                  style: TextStyleGetter.mainButtonText,
                ),
              ),
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
                  onTap: () {
                    print("dosa");
                  },
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
            const SizedBox(width: 5,),
            InkWell(
              onTap: (){},
              child: Text(
                SentencesGetter.loginSignUp,
                style: TextStyleGetter.loginSignUp,
              
              ),
            )
            ],),
            
          ],
        ),
      ),
    );
  }
}
