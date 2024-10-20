import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the SocialLoginButton widget
import 'package:aladia/shared/components/buttons/social_login_button.dart';

@widgetbook.UseCase(name: 'Google Login', type: SocialLoginButton)
Widget buildSocialLoginButtonGoogleUseCase(BuildContext context) {
  return SocialLoginButton(
    icon: Image.asset('assets/icons/google.png', height: 24),
    label: 'Sign in with Google',
    onPressed: () {
      print('Google login pressed');
    },
  );
}

@widgetbook.UseCase(name: 'Facebook Login', type: SocialLoginButton)
Widget buildSocialLoginButtonFacebookUseCase(BuildContext context) {
  return SocialLoginButton(
    icon: Image.asset('assets/icons/facebook.png', height: 24),
    label: 'Sign in with Facebook',
    onPressed: () {
      print('Facebook login pressed');
    },
  );
}

@widgetbook.UseCase(name: 'Apple Login', type: SocialLoginButton)
Widget buildSocialLoginButtonAppleUseCase(BuildContext context) {
  return SocialLoginButton(
    icon: Image.asset('assets/icons/apple.png', height: 24),
    label: 'Sign in with Apple',
    onPressed: () {
      print('Apple login pressed');
    },
  );
}
