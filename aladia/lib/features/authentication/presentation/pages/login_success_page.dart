import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(70, 100, 70, 0),
          child: Container(
            child: Column(
              children: [
                Image.asset("assets/images/aladia_logo.png"),
                Text("Login Successful")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
