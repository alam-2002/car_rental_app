import 'package:car_rental_app/data/models/car.dart';
// import 'package:equatable/equatable.dart';

abstract class CarState /*extends Equatable*/ {}

// loading state
class CarsLoading extends CarState {
  // @override
  // List<Object?> get props => [];
}

// loaded state
class CarsLoaded extends CarState {
  final List<Car> cars;

  CarsLoaded(this.cars);

  // @override
  // List<Object?> get props => [cars];
}

// error state
class CarsError extends CarState {
  final String message;

  CarsError(this.message);

  // @override
  // List<Object?> get props => [message];
}
