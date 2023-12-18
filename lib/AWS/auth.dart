import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:ridetracker/AWS/amplifyconfiguration.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:ridetracker/Widgets/reset_password.dart';

//configure amplify upon starting the app
Logger logger = Logger();
Future<void> configureAmplify() async {
  //Adding the plugins to authenticate login to amplify
  final authplugin = AmplifyAuthCognito();
  Amplify.addPlugin(authplugin);

  //Once Plugins are added , configure amplify

  try {
    await Amplify.configure(amplifyconfig);
    logger.i("Amplify authentication configuration successful");
  } on AmplifyAlreadyConfiguredException {
    logger.i("Amplify already configured");
  }
}

//Check if the user is signed in
Future<bool> isUserSignedIn() async {
  final status = await Amplify.Auth.fetchAuthSession();
  return status.isSignedIn;
}

//Sign in a user
Future<void> signInUser(String username, String password) async {
  try {
    final signIn =
        await Amplify.Auth.signIn(username: username, password: password);
    await _handleSignIn(signIn);
  } on AuthException catch (authException) {
    logger.e("Error signing in ${authException.message}");
  }
}

//Handle the user signIn
Future _handleSignIn(SignInResult signIn) async {
  switch (signIn.nextStep.signInStep) {
    case AuthSignInStep.done:
      logger.i("Sign In successful");
      break;
    case AuthSignInStep.confirmSignInWithNewPassword:
      logger.i("Enter a new password to finish signing in");
      //Navigate to the reset password screen
      break;
    default:
      logger.i("${signIn.nextStep} is the next step.");
      break;
  }
}

//Handle what happens if the user is logging in for the first time
Future<void> handleResetPassword(String newPassword) async {
  try {
    final result =
        await Amplify.Auth.confirmSignIn(confirmationValue: newPassword);
    return _handleSignIn(result);
  } on AuthException catch (authException) {
    logger.i("Could not be aithenticated ${authException.message}");
  }
}

void resetPasswordScreen() {}
