import 'package:flutter/material.dart';
import 'package:checkar_app/features/explore/models/mechanic_shop.dart';

class ExploreData {
  ExploreData._();

  static const List<MechanicShop> nearbyMechanics = [
    MechanicShop(
      name: 'AutoCare Elite',
      rating: 4.8,
      details: '0.8 miles away • Open until 6 PM',
      icon: Icons.handyman_outlined,
    ),
    MechanicShop(
      name: 'Precision Garage',
      rating: 4.5,
      details: '1.4 miles away • Closes in 2h',
      icon: Icons.build_outlined,
    ),
    MechanicShop(
      name: 'QuickFix Motors',
      rating: 4.2,
      details: '2.1 miles away • 24/7 Service',
      icon: Icons.local_taxi_outlined,
    ),
  ];
}
