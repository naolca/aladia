import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
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
        child: Text(
          "Enter",
          style: TextStyle(
              color: Theme.of(context).textTheme.displayMedium?.color),
        ),
      ),
    );
  }
}
