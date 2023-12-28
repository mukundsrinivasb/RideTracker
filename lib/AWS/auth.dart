import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:ridetracker/AWS/amplifyconfiguration.dart';
import 'package:logger/logger.dart';

//configure amplify upon starting the app
Logger logger = Logger();

/// Configures Amplify for authentication using the specified plugins and configuration.
///
/// This method initializes and configures Amplify for authentication by adding the
/// necessary authentication plugin (in this case, AmplifyAuthCognito) and configuring
/// Amplify with the provided configuration (`amplifyconfig`).
///
/// Example usage:
/// ```dart
/// await configureAmplify();
/// // Amplify is now configured for authentication, and you can proceed with authentication operations.
/// ```
///
/// Note: Ensure that you have already imported and configured the necessary dependencies
/// before using this method, such as importing the Amplify library and defining the
/// `amplifyconfig` configuration.
///
/// Throws:
/// - AmplifyAlreadyConfiguredException: If Amplify is already configured, it logs a message
///   indicating that Amplify is already configured.
/// - Other exceptions: Any other exceptions that may occur during the configuration process.
///
/// See also:
/// - [Amplify], the main entry point for Amplify Flutter.
/// - [AmplifyAuthCognito], the authentication plugin for Cognito used in this configuration.
/// - [AmplifyAlreadyConfiguredException], an exception thrown when attempting to configure
///   Amplify when it is already configured.
///
/// Usage example:
/// ```dart
/// try {
///   await configureAmplify();
///   // Amplify is now configured for authentication.
/// } catch (e) {
///   // Handle configuration errors.
///   print("Error configuring Amplify: $e");
/// }
/// ```

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

/// Signs in a user with the specified username and password using Amplify Auth.
///
/// This method attempts to sign in a user with the provided `username` and `password`
/// using Amplify Auth. It returns a [Future] that resolves to a [SignInResult] object,
/// representing the result of the sign-in attempt.
///
/// Example usage:
/// ```dart
/// try {
///   SignInResult signInResult = await signInUser('john_doe', 'password123');
///   // Use the 'signInResult' to handle the result of the sign-in operation.
/// } catch (e) {
///   // Handle sign-in errors.
///   print("Error signing in: $e");
/// }
/// ```
///
/// Parameters:
/// - [username]: The username of the user attempting to sign in.
/// - [password]: The password of the user attempting to sign in.
///
/// Returns:
/// - A [Future] that resolves to a [SignInResult] object representing the result of
///   the sign-in attempt.
///
/// Throws:
/// - [AuthException]: If an authentication-related exception occurs during the sign-in
///   process, it logs an error message and throws a generic [Exception] with a message
///   indicating that the sign-in failed.
///
/// See also:
/// - [Amplify.Auth.signIn], the Amplify Auth method used to sign in a user.
/// - [SignInResult], the object representing the result of a sign-in attempt.
/// - [AuthException], an exception type thrown for authentication-related errors.
///
/// Usage example:
/// ```dart
/// try {
///   SignInResult signInResult = await signInUser('john_doe', 'password123');
///   // Use the 'signInResult' to handle the result of the sign-in operation.
/// } catch (e) {
///   // Handle sign-in errors.
///   print("Error signing in: $e");
/// }
/// ```

Future<SignInResult> signInUser(String username, String password) async {
  try {
    return await Amplify.Auth.signIn(username: username, password: password);
  } on AuthException catch (authException) {
    logger.e("Error signing in ${authException.message}");
    throw Exception("Could not sign in ");
  }
}

/// Maps the user attributes from the [SignInResult] to a [Map<String, String>].
///
/// This function takes a [SignInResult] and extracts the user attributes from
/// the additional information. It then maps the attributes into a [Map<String, String>]
/// where the attribute names are the keys, and their corresponding values are the values.
///
/// The expected format of the user attributes is assumed to be a comma-separated string,
/// where each attribute is in the form of "key:value".
///
/// Example:
/// ```dart
/// SignInResult signInResult = ...; // Obtain a SignInResult
/// Map<String, String> mappedAttributes = mapUserAttributes(signInResult);
/// ```
///
/// The resulting [Map<String, String>] may be used to access specific user attributes
/// based on their keys.
Map<String, String> mapUserAttributes(SignInResult signinStatus) {
  Map<String, String> userAttributesMapped = <String, String>{};
  MapEntry<String, String> additionalAttributes = signinStatus
      .nextStep.additionalInfo.entries
      .firstWhere((element) => element.key == "userAttributes");
  for (var element in additionalAttributes.value.split(',')) {
    var splitElements = element.split(':');
    final key = splitElements[0].trim();
    final value = splitElements[1].trim();
    final addEntry = <String, String>{
      key.substring(1, key.length - 1): value.substring(1, value.length - 1)
    };
    userAttributesMapped.addEntries(addEntry.entries);
  }
  return userAttributesMapped;
}

/// Handles the sign-in process and returns an integer code indicating the next step.
///
/// This method takes a [SignInResult] object as a parameter, which represents the
/// result of a sign-in attempt. The method then examines the `signInStep` property
/// of the `nextStep` field within the [SignInResult] to determine the next step
/// in the sign-in process.
///
/// The method uses a switch statement to handle different sign-in steps and returns
/// an integer code accordingly:
/// - If the sign-in process is complete (AuthSignInStep.done), it returns 1.
/// - If the sign-in process requires confirmation with a new password
///   (AuthSignInStep.confirmSignInWithNewPassword), it returns 2.
/// - For any other sign-in step, it returns 0.
///
/// Example usage:
/// ```dart
/// SignInResult signInResult = //... obtain the sign-in result
/// int nextStepCode = handleSignIn(signInResult);
/// // Use the 'nextStepCode' to determine the next action in your application.
/// ```
///
/// Parameters:
/// - [signIn]: A [SignInResult] object representing the result of a sign-in attempt.
///
/// Returns:
/// - An integer code indicating the next step in the sign-in process:
///   - 1 if the sign-in process is complete.
///   - 2 if confirmation with a new password is required.
///   - 0 for any other sign-in step.

int handleSignIn(SignInResult signIn) {
  switch (signIn.nextStep.signInStep) {
    case AuthSignInStep.done:
      return 1;
    case AuthSignInStep.confirmSignInWithNewPassword:
      return 2;
    default:
      return 0;
  }
}

Future<SignInResult> handleNewPassword(String newPassword) async {
  final SignInResult singInResult =
      await Amplify.Auth.confirmSignIn(confirmationValue: newPassword);
  return singInResult;
}
