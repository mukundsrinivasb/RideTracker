import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class PrimaryInterface extends StatelessWidget {
  const PrimaryInterface({Key? key}) : super(key: key);

  Future<String> get locationPermission async =>
      "${Geolocator.checkPermission()}";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: locationPermission,
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            logger.e(
                "Error in getting the status of permission ${snapshot.error}");
          } else {
            return Text(snapshot.data ?? 'Permission not available');
          }
        } catch (exception) {
          logger.e("An unexpected error thrown $exception");
          return Text("The exception thrown was $exception");
        }

        return const Text("Permission not available ...");
      },
    );
  }
}
