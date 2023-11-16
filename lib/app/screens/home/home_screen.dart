


import 'package:flutter/material.dart';

import '../common_widgets/main_button.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding:  EdgeInsets.only(bottom: 10),
                child:  Text(
                  'You are already logged in',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
              ),
              MainButton(
                onPressedFunction: () {
                  viewModel.onLogOutButtonPressed();
                },
                text: "Log out",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MainButton(
                  onPressedFunction: () {
                    viewModel.getAllProduct();
                  },
                  text: "Get products",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
