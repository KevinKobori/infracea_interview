import 'package:challenge_infracea/data/flights_data.dart';
import 'package:challenge_infracea/models/flight_model.dart';

final List<FlightModel> flightsAvailable = flightsAvailableJson
    .asMap()
    .map((index, value) =>
        MapEntry(index, FlightModel.fromMap(flightsAvailableJson[index])))
    .values
    .toList();
