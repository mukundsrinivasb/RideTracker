import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridetracker/reset_password.dart';
import 'package:ridetracker/primary_interface.dart';
import 'login_screen.dart';
import 'AWS/auth.dart';
import 'Styles/color.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DarkTheme darkTheme = DarkTheme();
    return MaterialApp(
      title: 'RideTracker',
      initialRoute: '/',
      routes: {
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/primary_interface': (context) => const PrimaryInterface(),
        '/login_screen': (context) => const LoginScreen()
      },
      theme: ThemeData(primaryColor: darkTheme.getPrimaryBackground),
      home: const SplashScreen(), // Show the splash screen initially
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late bool isSignedIn;

  @override
  void initState() {
    super.initState();
    configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    DarkTheme darkTheme = DarkTheme();
    return FutureBuilder(
        future: isUserSignedIn(),
        builder: (context, snapshot) {
          try {
            if (snapshot.data == true) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrimaryInterface()));
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          } catch (exception) {}
          return Scaffold(
            backgroundColor: darkTheme.getPrimaryBackground,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Your SVG logo
                  SvgPicture.asset(
                    'assets/Vectors/main_logo.svg',
                    width: 150,
                    height: 150,
                    colorFilter: const ColorFilter.mode(
                      Color.fromARGB(1, 35, 69, 91),
                      BlendMode.srcATop,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'RideTracker',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(35, 69, 91, 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
