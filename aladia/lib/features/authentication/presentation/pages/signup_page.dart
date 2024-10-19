import 'package:aladia/features/authentication/presentation/pages/password_fill_page.dart';
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

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

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
                        hintText: 'First Name',
                        icon: Icons.person,
                        controller: firstNameController,
                        isDisabled: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 50,
                      child: InputField(
                        hintText: 'Last Name',
                        icon: Icons.person,
                        controller: lastNameController,
                        isDisabled: false,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 50,
                      child: InputField(
                        hintText: 'Password',
                        icon: Icons.lock,
                        controller: passwordController,
                        isDisabled: false,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 50,
                      child: InputField(
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                        controller: confirmPasswordController,
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
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ActionButton(
                            onPressed: () {
                              final email = emailController.text;
                              // context
                              //     .read<LoginBloc>()
                              //     .add(CheckUserExistence(email));
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