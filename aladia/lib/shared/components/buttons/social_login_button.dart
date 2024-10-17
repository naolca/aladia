import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget icon; // Change this from Icon to Widget
  final String label;
  final VoidCallback onPressed;

  const SocialLoginButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust border radius here
                // Set border color here
              ),
            ),
            textStyle: MaterialStateProperty.all(TextStyle(
                color: Theme.of(context).textTheme.displayMedium?.color))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(label,
                style: TextStyle(
                    color: Theme.of(context).textTheme.displayMedium?.color)),
          ],
        ),
      ),
    );
  }
}
