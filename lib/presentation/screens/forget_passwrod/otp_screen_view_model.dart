import 'package:demo_project/data/repositories/forget_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreenViewModel {
  OtpScreenViewModel();
  
  //constants
  final formkey = GlobalKey<FormState>();
  final _repo = ForgetPasswordRepo();

  //providers
  final isEnableSubmit = StateProvider<bool>((ref) => false);
  final isLoading = StateProvider<bool>((ref) => false);

  //on submit button clicked
  void onSubmitCliked(WidgetRef ref, context) async {
    
  }

  
}