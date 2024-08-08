import 'package:demo_project/constants/colors_getter.dart';
import 'package:demo_project/constants/images_getter.dart';
import 'package:demo_project/constants/sentences_getter.dart';
import 'package:demo_project/presentation/screens/account/account_view_model.dart';
import 'package:demo_project/presentation/widgets/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key, required this.popBottomNavBar});
  final _viewModel = AccountViewModel();
  final Function() popBottomNavBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGetter.white255,
      body: ListView(
        children: [
          Consumer(
            builder: (context, ref, child) => ListTile(
              leading: Image.asset(ImagesGetter.exitIcon),
              tileColor: ColorsGetter.grey239,
              title: StyledText(SentencesGetter.logOutButton, fontSize: 14, fontWeight: FontWeight.w500, color: ColorsGetter.grey37),
              onTap: ()  {_viewModel.logout(context, ref, popBottomNavBar);},
            ),
          ),
        ],
      ),
    );
  }
}
