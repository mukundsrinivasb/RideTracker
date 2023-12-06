import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Show the splash screen initially
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<EdgeInsets> _animation;

  @override
  void initState() {
    super.initState();

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

    // Navigate to the main screen after animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          padding: _animation.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your SVG logo
              SvgPicture.asset('assets/main_logo.svg',
                  width: 150,
                  height: 150,
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(1, 35, 69, 91), BlendMode.srcATop)),
              const SizedBox(height: 20),
              const Text(
                'rideTracker',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
