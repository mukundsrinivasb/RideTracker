import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Set up an aws amplify backend using the credentials below
//something@1234.com
//Some@1234thing
class LoginButton extends StatelessWidget {
  final String svgAsset;
  final VoidCallback onPressed;

  const LoginButton(
      {super.key, required this.svgAsset, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          shape: const CircleBorder(eccentricity: 0),
          backgroundColor: const Color.fromRGBO(101, 175, 255, 1)),
      child: SvgPicture.asset(svgAsset, width: 24, height: 24),
    );
  }
}
