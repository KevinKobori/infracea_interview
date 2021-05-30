class SeatModel {
  bool? available;

  SeatModel({
    this.available,
  });

  SeatModel.fromMap(Map<String, dynamic> map) {
    available = map['available'] as bool?;
  }
}
