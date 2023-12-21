import 'package:amplify_flutter/amplify_flutter.dart';
import 'AWS/auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    Future navigateToNewPasswordPage(SignInResult signInStatus) async {
      Map<String, String> attributes = mapUserAttributes(signInStatus);
      String? userName = attributes['preferred_username'];
      logger.i('The attributes are $attributes');
      logger.i('The user name is $userName');
      if (signInStatus.nextStep.signInStep ==
          AuthSignInStep.confirmSignInWithNewPassword) {
        Navigator.pushNamed(context, '/reset_password', arguments: userName);
      }
    }

    final TextEditingController usernameController = TextEditingController();
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
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromRGBO(22, 33, 41, 1),
                  ),
                ),
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
