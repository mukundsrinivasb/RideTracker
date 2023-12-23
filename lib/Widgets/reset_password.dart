import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ridetracker/Styles/color.dart';
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
    DarkTheme darkTheme = DarkTheme();
    //The name of the user is sent to this screen from the login screen
    final String? userName =
        ModalRoute.of(context)?.settings.arguments as String?;
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: darkTheme.getPrimaryBackground,
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
                    fillColor: Color.fromRGBO(101, 175, 255, 1),
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
                  //If the change is successful
                  // Map userName =
                  //     ModalRoute.of(context)?.settings.arguments as Map;
                  logger.i('The new password was set');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}