import 'package:car_rental_app/components/text_widget.dart';
import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/pages/car_details_page.dart';
import 'package:car_rental_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsPage(car: car),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: concreteWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/car_image.png',
              height: 120,
            ),
            Label(
              label: car.model,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/gps.png'),
                        Label(
                          label: ' ${car.distance.toStringAsFixed(0)}km',
                          fontSize: 15,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Image.asset('assets/images/pump.png'),
                        Label(
                          label: ' ${car.fuelCapacity.toStringAsFixed(0)}L',
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                Label(
                  label: '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                  fontSize: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
