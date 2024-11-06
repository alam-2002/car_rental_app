import 'package:car_rental_app/components/text_widget.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_state.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Label(
          label: 'Choose Your Car',
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          print(state);
          // loading state
          if (state is CarsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // loaded state
          else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );

            // CarDetailsPage(car: state.cars as Car);
          }
          // error state
          else if (state is CarsError) {
            print(state.message);
            return Center(child: Label(label: 'Error - ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
