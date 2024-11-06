import 'package:car_rental_app/components/text_widget.dart';
import 'package:car_rental_app/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const double latitude = 18.516726;
const double longitude = 73.856255;

class MapDetailsPage extends StatelessWidget {
  final Car car;
  const MapDetailsPage({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(latitude, longitude),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(car: car),
          ),
        ],
      ),
    );
  }
}

Widget carDetailsCard({required Car car}) {
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Label(
                label: '${car.model}',
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
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
                    size: 14,
                  ),
                  SizedBox(width: 5),
                  Label(
                    label: '${car.fuelCapacity.toString()}',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  label: 'Features',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                featureIcons(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(
                      label: '\$${car.pricePerHour}/day',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Label(
                        label: 'Book Now',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          child: Image.asset(
            'assets/images/white_car.png',
            height: 90,
          ),
        ),
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(
        icon: Icons.local_gas_station,
        title: 'Diesel',
        subtitle: 'Common Rail',
      ),
      featureIcon(
        icon: Icons.speed,
        title: 'Acceleration',
        subtitle: '0 - 100km/s',
      ),
      featureIcon(
        icon: Icons.ac_unit,
        title: 'Cold',
        subtitle: 'Temp Control',
      ),
    ],
  );
}

Widget featureIcon({required IconData icon, required String title, required String subtitle}) {
  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Column(
      children: [
        Icon(
          icon,
          size: 28,
        ),
        SizedBox(height: 5),
        Label(
          label: title,
          fontSize: 14,
        ),
        SizedBox(height: 5),
        Label(
          label: subtitle,
          color: Colors.grey,
          fontSize: 10,
        ),
      ],
    ),
  );
}