class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  // factory Car.fromMap(Map<String, dynamic> map) {
  //   return Car(
  //     model: map['model'],
  //     distance: map['distance'],
  //     fuelCapacity: map['fuelCapacity'],
  //     pricePerHour: map['pricePerHour'],
  //   );
  // }
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      model: map['model'],
      distance: double.tryParse(map['distance'].toString()) ?? 0.0,
      fuelCapacity: double.tryParse(map['fuelCapacity'].toString()) ?? 0.0,
      pricePerHour: double.tryParse(map['pricePerHour'].toString()) ?? 0.0,
    );
  }
}
