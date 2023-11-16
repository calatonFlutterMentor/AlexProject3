import 'package:flutter/material.dart';

import '../common_widgets/main_button.dart';
import '../screen_factory/screen_factory.dart';
import 'common_widgets/input_field.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fomKeyEmail = GlobalKey<FormState>();
  final fomKeyPassword = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Register below with your details!',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LoginInputField(
                  controller: emailController,
                  hintText: "email",
                  errorMassage: "Enter correct email",
                  formKey: fomKeyEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LoginInputField(
                  controller: passwordController,
                  hintText: "password",
                  errorMassage: "Enter correct password",
                  formKey: fomKeyPassword,
                ),
              ),
              MainButton(
                text: "Sing in",
                onPressedFunction: () async {
                  final validateEmail = fomKeyEmail.currentState!.validate();
                  final validatePassword = fomKeyEmail.currentState!.validate();
                  if(validateEmail && validatePassword){
                    await Future.delayed(const Duration(seconds: 2));
                    widget.viewModel.onLogInButtonPressed(
                        emailController.text.toString(),
                        passwordController.text.toString());
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => ScreenFactory.buildInitialScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
