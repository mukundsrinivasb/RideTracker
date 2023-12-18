import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ridetracker/AWS/auth.dart';
import 'package:ridetracker/Widgets/login_button.dart';

//Set a new password after the first authentication into aws amplify

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() {
    return ResetPasswordScreenState();
  }
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 5, 6, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromRGBO(22, 33, 41, 1),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginButton(
                svgAsset: 'assets/login_arrow.svg',
                onPressed: () {
                  logger.i('The new password is : ${passwordController.text}');
                  handleResetPassword(passwordController.text);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
