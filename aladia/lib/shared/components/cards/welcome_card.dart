import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the image based on the theme
    final String backgroundImage =
        Theme.of(context).brightness == Brightness.dark
            ? 'assets/images/gradient.png'
            : 'assets/images/light_gradient.png';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage), // Set the background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 125,
                child: Image.asset(
                  'assets/images/aladia_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Aladia",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Create or access your account from here",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
