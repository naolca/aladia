import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Container(
        height: 145,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Theme.of(context).textTheme.displayMedium!.color!,
            width: 0.3,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(
                -4.7), // Convert degrees to radians for rotation
            colors: isLightTheme
                ? [
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color.fromARGB(255, 160, 159, 159), // Lighter gray
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    // Color(0xFF1A1A1A), // Very dark gray
                    // Color(0xFF1A1A1A), // Very dark gray
                    Color.fromARGB(255, 160, 159, 159), // Lighter gray
                    Color.fromARGB(255, 160, 159, 159), // Lighter gray

                    Color(0xFFFFFFFF), // White
                    Color(0xF0FFFFFF), // Transparent white
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                    Color(0xFFFFFFFF), // White
                  ]
                : [
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF6E6E6E), // Lighter gray
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF1A1A1A), // Very dark gray
                    Color(0xFF1A1A1A), // Very dark gray
                    Color(0xFF000000), // Deep black
                    Color(0xF0000000), // Transparent black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                    Color(0xFF000000), // Deep black
                  ],
            stops: [
              0.0, // Deep black
              0.1, // Deep black
              0.2, // Deep black
              0.3, // Deep black
              0.4, // Deep black
              0.45, // Deep black
              0.49, // Deep black
              0.5, // Silver (thin)
              0.51, // Deep black
              0.53,
              0.54,
              0.58, // Very dark gray
              0.6, // Very dark gray
              0.7, // Deep black
              0.8, // Transparent black
              0.9, // Deep black
              0.95, // Deep black
              1.0, // Deep black
            ],
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
                  padding: EdgeInsets.fromLTRB(35, 10, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Aladia,",
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
