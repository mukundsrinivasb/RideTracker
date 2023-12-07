import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          shape: const CircleBorder(eccentricity: 1),
          backgroundColor: const Color.fromRGBO(22, 33, 41, 1)),
      child: SvgPicture.asset(
        svgAsset,
        width: 24,
        height: 24,
      ),
    );
  }
}
