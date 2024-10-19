import 'package:aladia/core/app_theme.dart';
import 'package:aladia/shared/components/buttons/action_button.dart';
import 'package:aladia/shared/components/buttons/social_login_button.dart';
import 'package:aladia/shared/components/cards/welcome_card.dart';
import 'package:aladia/shared/components/inputs/input_field.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetBookApp());
}

class WidgetBookApp extends StatelessWidget {
  const WidgetBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Widgetbook.material(
      lightTheme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      addons: [
        ThemeAddon<ThemeData>(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: AppTheme.lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: AppTheme.darkTheme,
            ),
          ],
          themeBuilder: (BuildContext context, ThemeData theme, Widget child) {
            return MaterialApp(
              theme: theme,
              home: child,
            );
          },
        ),
      ],
      directories: [
        WidgetbookComponent(
          name: 'ActionButton',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) => ActionButton(
                onPressed: () {
                  print('Action Button Pressed');
                },
                child: Text(
                  "Enter",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.displayLarge?.color),
                ),
              ),
            ),
            WidgetbookUseCase(
                name: 'Loading',
                builder: (context) => ActionButton(
                    onPressed: () {
                      print('Action Button is Loading');
                    },
                    child: CircularProgressIndicator(
                      color: Theme.of(context).textTheme.displayLarge?.color,
                    ))),
          ],
        ),
        WidgetbookComponent(
          name: 'SocialLoginButton',
          useCases: [
            WidgetbookUseCase(
              name: 'Google Login',
              builder: (context) => SocialLoginButton(
                icon: Image.asset('assets/icons/google.png', height: 24),
                label: 'Sign in with Google',
                onPressed: () {
                  print('Google login pressed');
                },
              ),
            ),
            WidgetbookUseCase(
              name: 'Facebook Login',
              builder: (context) => SocialLoginButton(
                icon: Image.asset('assets/icons/facebook.png', height: 24),
                label: 'Sign in with Facebook',
                onPressed: () {
                  print('Facebook login pressed');
                },
              ),
            ),
            WidgetbookUseCase(
              name: "Apple Login",
              builder: (context) => SocialLoginButton(
                icon: Image.asset('assets/icons/apple.png', height: 24),
                label: 'Sign in with Apple',
                onPressed: () {
                  print('Apple login pressed');
                },
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'WelcomeCard',
          useCases: [
            WidgetbookUseCase(
              name: 'Default Welcome',
              builder: (context) => const WelcomeCard(),
            ),
          ],
        ),
        WidgetbookComponent(name: "Input Field", useCases: [
          WidgetbookUseCase(
              name: "Email Field",
              builder: (context) => InputField(
                    hintText: 'Enter Email',
                    icon: Icons.email,
                    controller: emailController,
                    isDisabled: false,
                  )),
          WidgetbookUseCase(
              name: "Email Field(Disabled)",
              builder: (context) => InputField(
                    hintText: 'Enter Email',
                    icon: Icons.email,
                    controller: emailController,
                    isDisabled: true,
                  )),
          WidgetbookUseCase(
              name: "Password Field",
              builder: (context) => InputField(
                    hintText: 'Enter Password',
                    icon: Icons.lock,
                    isPassword: true,
                    controller: passwordController,
                    isDisabled: false,
                  )),
        ])
      ],
    );
  }
}
