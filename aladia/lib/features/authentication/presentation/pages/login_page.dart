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
import 'package:aladia/shared/components/inputs/input_field.dart'; // Import the new InputField widget

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WelcomeCard(),
            // Email input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 50,
                child: InputField(
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  controller: emailController,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Password input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 50,
                child: InputField(
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  isPassword: true, // Mark this field as a password
                  controller: passwordController,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Login button
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator();
                } else if (state is LoginFailure) {
                  return Text('Error: ${state.error}');
                }
                return ActionButton(
                  onPressed: () {
                    // Get the values from the controllers and trigger the login event
                    final email = emailController.text;
                    final password = passwordController.text;
                    context
                        .read<LoginBloc>()
                        .add(LoginRequested(email, password));
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            const Text('Or'),
            const SizedBox(height: 16),
            // Social login buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLoginButton(
                  icon: Image.asset("assets/icons/google.png", height: 24),
                  label: 'Sign in with Google',
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginWithGoogle());
                  },
                ),
                const SizedBox(width: 16),
                SocialLoginButton(
                  icon: Icon(Icons.facebook),
                  label: 'Sign in with Facebook',
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginWithFacebook());
                  },
                ),
                const SizedBox(width: 16),
                SocialLoginButton(
                  icon: Icon(Icons.apple),
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
    );
  }
}

//  Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: Container(
//                 height: 50,
//                 child: TextFormField(
//                   decoration: const InputDecoration(
//                     hintText: 'Enter your email',
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                 ),
//               ),
//             ),