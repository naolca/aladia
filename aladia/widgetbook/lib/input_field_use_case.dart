import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the InputField widget
import 'package:aladia/shared/components/inputs/input_field.dart';

@widgetbook.UseCase(name: 'Email Field', type: InputField)
Widget buildInputFieldEmailUseCase(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  return InputField(
    hintText: 'Enter Email',
    icon: Icons.email,
    controller: emailController,
    isDisabled: false,
  );
}

@widgetbook.UseCase(name: 'Email Field (Disabled)', type: InputField)
Widget buildInputFieldEmailDisabledUseCase(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  return InputField(
    hintText: 'Enter Email',
    icon: Icons.email,
    controller: emailController,
    isDisabled: true,
  );
}

@widgetbook.UseCase(name: 'Password Field', type: InputField)
Widget buildInputFieldPasswordUseCase(BuildContext context) {
  final TextEditingController passwordController = TextEditingController();
  return InputField(
    hintText: 'Enter Password',
    icon: Icons.lock,
    isPassword: true,
    controller: passwordController,
    isDisabled: false,
  );
}
