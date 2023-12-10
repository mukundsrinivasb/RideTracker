import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:ridetracker/amplifyconfiguration.dart';
import 'package:logger/logger.dart';

//configure amplify upon starting the app
Future<void> _configureAmplify() async {
  Logger logger = Logger();
  //Adding the plugins to authenticate login to amplify
  final authplugin = AmplifyAuthCognito();
  Amplify.addPlugin(authplugin);

  //Once Plugins are added , configure amplify

  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    logger.i("Amplify already configured");
  }
}

//Check if the user is signed in
Future<bool> isUserSignedIn() async {
  final status = await Amplify.Auth.fetchAuthSession();
  return status.isSignedIn;
}
