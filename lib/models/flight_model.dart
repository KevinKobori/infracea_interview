import 'package:challenge_infracea/models/seat_model.dart';

class FlightModel {
  String? id;
  String? logo;
  String? title;
  double? price;
  List<dynamic>? seats;

  FlightModel({
    this.id,
    this.logo,
    this.title,
    this.price,
    this.seats,
  });

  FlightModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String?;
    logo = map['logo'] as String?;
    title = map['title'] as String?;
    price = map['price'] as double?;
    seats = map['seats'].map((seats) => SeatModel.fromMap(seats)).toList();
  }
}
