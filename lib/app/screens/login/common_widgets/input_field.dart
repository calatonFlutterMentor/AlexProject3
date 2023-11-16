import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  TextEditingController controller;
  final String hintText;
  final String errorMassage;
  final GlobalKey<FormState> formKey;

  LoginInputField(
      {super.key, required this.controller, required this.hintText, required this.errorMassage, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value != null && value.length < 4) {
            return errorMassage;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
