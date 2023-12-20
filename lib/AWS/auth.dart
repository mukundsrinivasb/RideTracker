import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:ridetracker/AWS/amplifyconfiguration.dart';
import 'package:logger/logger.dart';

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
Future<SignInResult> signInUser(String username, String password) async {
  try {
    return await Amplify.Auth.signIn(username: username, password: password);
  } on AuthException catch (authException) {
    logger.e("Error signing in ${authException.message}");
    throw Exception("Could not sign in ");
  }
}

//Design what screen to present when the user logs in
void onSignIn(SignInResult signInStatus, BuildContext context) {
  switch (signInStatus.nextStep.signInStep) {
    case AuthSignInStep.done:
      //Navigate to the main page
      break;
    case AuthSignInStep.confirmSignInWithNewPassword:
      //Navigate to the page where the user is prompted to enter a new password
      break;
    default:
  }
}
