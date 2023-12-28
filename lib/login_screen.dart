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

    ///
    /// Navigates to a new password page based on the sign-in status.
    ///
    /// This asynchronous method takes a [SignInResult] object as its parameter, extracts
    /// user attributes using the `mapUserAttributes` function, and retrieves the user's
    /// `preferred_username`. It then determines the sign-in status using the `handleSignIn`
    /// function. If the sign-in status is 2 (indicating the need to confirm sign-in with a
    /// new password), it navigates to the '/reset_password' page with the user's username
    /// as an argument.
    ///
    /// Parameters:
    /// - [signInStatus]: A [SignInResult] object representing the result of a sign-in attempt.
    ///
    /// Returns:
    /// - A [Future] representing the navigation to the new password page, if applicable.
    ///
    Future navigateToNewPasswordPage(SignInResult signInStatus) async {
      Map<String, String> attributes = mapUserAttributes(signInStatus);
      String? userName = attributes["preferred_username"];
      int signInStatusValue = handleSignIn(signInStatus);

      if (signInStatusValue == 2) {
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
