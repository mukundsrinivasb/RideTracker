import 'package:amplify_flutter/amplify_flutter.dart';
import 'AWS/auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'widgets/login_button.dart';
import 'Styles/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    DarkTheme darkTheme = DarkTheme();
    String userName;
    Future navigateToNewPasswordPage(SignInResult signInStatus) async {
      Map<String, String> attributes = mapUserAttributes(signInStatus);
      logger.i('The attributes are $attributes');
      String? userName = attributes["preferred_username"];

      if (signInStatus.nextStep.signInStep ==
          AuthSignInStep.confirmSignInWithNewPassword) {
        Navigator.pushNamed(context, '/reset_password', arguments: userName);
      }
    }

    final TextEditingController usernameController = TextEditingController();
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
                TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromRGBO(101, 175, 255, 1))),
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
                svgAsset: 'assets/Vectors/login_arrow.svg',
                onPressed: () async {
                  SignInResult status = await signInUser(
                      usernameController.text, passwordController.text);
                  navigateToNewPasswordPage(status);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
