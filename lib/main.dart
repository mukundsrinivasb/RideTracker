import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridetracker/reset_password.dart';
import 'package:ridetracker/primary_interface.dart';
import 'login_screen.dart';
import 'AWS/auth.dart';
import 'Styles/color.dart';

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

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<EdgeInsets> _animation;
  late bool isSignedIn;

  @override
  void initState() {
    super.initState();
    configureAmplify();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<EdgeInsets>(
      begin: const EdgeInsets.only(top: 0.0),
      end: const EdgeInsets.only(top: 200.0), // Adjust this value as needed
    ).animate(_controller);

    // Start the animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

    //Check if the user is signed in
    void setSignedIn() async {
      Future<bool> getSignedIn() async {
        return await isUserSignedIn();
      }

      isSignedIn = await getSignedIn();
    }

    // Navigate to the login screen if the user is not logged in.
    //Navigate to the Login screen if the user is logged in.
    _controller.addStatusListener((status) {
      setSignedIn();
      if (status == AnimationStatus.completed) {
        if (isSignedIn) {
          logger.i("The user should be directed to the home page");
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          logger.i("The user was not signed in ");
        }
      }
    });
  }

//The colours of the scaffold will be stored in a file , and will change
//Depending on Dark or light mode
  @override
  Widget build(BuildContext context) {
    DarkTheme darkTheme = DarkTheme();
    return Scaffold(
      backgroundColor: darkTheme.getPrimaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your SVG logo
            SvgPicture.asset('assets/Vectors/main_logo.svg',
                width: 150,
                height: 150,
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(1, 35, 69, 91), BlendMode.srcATop)),
            const SizedBox(height: 20),
            const Text(
              'RideTracker',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(35, 69, 91, 1)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
