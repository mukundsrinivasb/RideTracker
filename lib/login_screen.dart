import 'dart:js';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'AWS/auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
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
                  logger.i('Button pressed');
                  logger.i('Username : ${usernameController.text}');
                  logger.i('Password : ${passwordController.text}');
                  SignInResult status = await signInUser(
                      usernameController.text, passwordController.text);
                  onSignIn(status);
                  mapUserAttributes(status);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future printSignInResult(
      String username, String password, BuildContext context) async {
    SignInResult status = await signInUser(username, password);
    mapUserAttributes(status);
  }
}
