import 'package:aladia/features/authentication/data/models/login_model.dart';
import 'package:aladia/shared/components/buttons/action_button.dart';
import 'package:aladia/shared/components/buttons/social_login_button.dart';
import 'package:aladia/shared/components/cards/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia/shared/components/inputs/input_field.dart';
// Import the new InputField widget
import "package:aladia/features/authentication/presentation/pages/login_success_page.dart";

class PasswordFillPage extends StatelessWidget {
  final String email;
  const PasswordFillPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 600, // Set the max width for larger screens
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth < 600 ? 2 : 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WelcomeCard(),
                  // Email input field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 50,
                      child: InputField(
                        hintText: email,
                        icon: Icons.email,
                        controller: emailController,
                        isDisabled: true,
                      ),
                    ),
                  ),

                  // Password input field

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 50,
                      child: InputField(
                        hintText: 'Enter your password',
                        icon: Icons.lock,
                        controller: passwordController,
                        isDisabled: false,
                        isPassword: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Login button
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is LoginSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSuccessPage()),
                          );
                        });
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return ActionButton(
                              onPressed: () {},
                              child: CircularProgressIndicator(
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                              ));
                        } else if (state is LoginFailure) {
                          return Column(
                            children: [
                              Text(
                                '${state.error}',
                                style: TextStyle(color: Colors.red),
                              ),
                              ActionButton(
                                  onPressed: () {
                                    final password = passwordController.text;
                                    context
                                        .read<LoginBloc>()
                                        .add(LoginRequested(email, password));
                                  },
                                  child: Text(
                                    "Enter",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.color),
                                  ))
                            ],
                          );
                        }
                        return ActionButton(
                            onPressed: () {
                              final password = passwordController.text;
                              context
                                  .read<LoginBloc>()
                                  .add(LoginRequested(email, password));
                            },
                            child: Text(
                              "Enter",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.color),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Social login buttons

                  const SizedBox(height: 16),
                  const Text('Terms & conditions'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
