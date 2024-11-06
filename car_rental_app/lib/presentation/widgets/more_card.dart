import 'package:car_rental_app/components/text_widget.dart';
import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: mineShaftBlack,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            // spreadRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(
                label: car.model,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Label(
                    label: '> ${car.distance} km',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 16,
                  ),
                  Label(
                    label: car.fuelCapacity.toString(),
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}
