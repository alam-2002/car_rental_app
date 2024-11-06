import 'package:car_rental_app/data/data_source/firebase_car_data_source.dart';
import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/domain/repository/car_repository.dart';

//implementation
class CarRepositoryImpl implements CarRepository{
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}