import 'package:aladia/features/authentication/presentation/pages/password_fill_page.dart';
import 'package:aladia/features/authentication/presentation/pages/signup_page.dart';
import 'package:aladia/shared/components/buttons/action_button.dart';
import 'package:aladia/shared/components/buttons/social_login_button.dart';
import 'package:aladia/shared/components/cards/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aladia/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia/shared/components/inputs/input_field.dart'; // Import the new InputField widget

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController();

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
                        hintText: 'Enter your email',
                        icon: Icons.email,
                        controller: emailController,
                        isDisabled: false,
                      ),
                    ),
                  ),

                  // Password input field

                  const SizedBox(height: 16),
                  // Login button
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is UserExists) {
                        // navigate to password fill page
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PasswordFillPage(
                                      email: emailController.text,
                                    )),
                          );
                        });
                      }
                      if (state is UserDoesNotExist) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage(
                                      email: emailController.text,
                                    )),
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
                                    final email = emailController.text;
                                    context
                                        .read<LoginBloc>()
                                        .add(CheckUserExistence(email));
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
                              final email = emailController.text;
                              context
                                  .read<LoginBloc>()
                                  .add(CheckUserExistence(email));
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
                  const Text('Or'),
                  const SizedBox(height: 16),
                  // Social login buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        icon:
                            Image.asset("assets/icons/google.png", height: 24),
                        label: 'Sign in with Google',
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginWithGoogle());
                        },
                      ),
                      const SizedBox(width: 16),
                      SocialLoginButton(
                        icon: Image.asset("assets/icons/facebook.png",
                            height: 24),
                        label: 'Sign in with Facebook',
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginWithFacebook());
                        },
                      ),
                      const SizedBox(width: 16),
                      SocialLoginButton(
                        icon: Image.asset("assets/icons/apple.png", height: 24),
                        label: 'Sign in with Apple',
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginWithApple());
                        },
                      ),
                    ],
                  ),
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
