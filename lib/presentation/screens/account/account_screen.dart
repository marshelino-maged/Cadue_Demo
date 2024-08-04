import 'package:demo_project/presentation/screens/account/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key, required this.popBottomNavBar});
  final _viewModel = AccountViewModel();
  final Function() popBottomNavBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Account Page'),
              TextButton(
                onPressed: () {
                  _viewModel.logout(context, ref, popBottomNavBar);
                },
                child: const Text('Go to Login'),
              ),
              if (ref.read(_viewModel.isLogingOut))
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
