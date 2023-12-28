//This file is to configure the api for the flutter application
import 'package:amplify_api/amplify_api.dart';
import 'package:ridetracker/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'amplifyconfiguration.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Future configureAmplifyAPI() async {
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  await Amplify.addPlugin(api);
  try {
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    logger.i('There was $e while configuring the backend');
  }
}

//A factory method to create a trip Object
Future createTrip(
    Units tripUnits,
    String vehicleMake,
    String vehicleModel,
    int vehicleYear,
    int startReading,
    int endReading,
    int fuelQuantity,
    String date) async {
  try {
    final trip = Trip(
        tripUnits: tripUnits,
        vehicleMake: vehicleMake,
        vehicleModel: vehicleModel,
        vehicleYear: vehicleYear,
        startReading: startReading,
        endReading: endReading,
        fuelQuantity: fuelQuantity,
        date: date);
    final request = ModelMutations.create(trip);
    final response = await Amplify.API.mutate(request: request).response;
    final createdResponse = response.data;

    // There could be two points of failure at this point .
    // - The Api could not be send the request
    // - There was an error in creating the response

    if (createdResponse == null) {}
  } on ApiException catch (e) {
    logger.e("The data could not be created , responded with $e");
  }
}
