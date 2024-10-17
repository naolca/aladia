import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          //you can an image as a backgound later

          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 150,
                child: Image.asset(
                  'assets/images/aladia_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Column(
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
