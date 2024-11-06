import 'package:car_rental_app/data/data_source/firebase_car_data_source.dart';
import 'package:car_rental_app/data/repository/car_repository_implementation.dart';
import 'package:car_rental_app/domain/repository/car_repository.dart';
import 'package:car_rental_app/domain/use_cases/get_cars.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {

    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(() => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));

  } catch (e) {
    print('Error - ${e.toString()}');
    throw e;
  }
}
