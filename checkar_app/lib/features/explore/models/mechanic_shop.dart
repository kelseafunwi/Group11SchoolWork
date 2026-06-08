import 'package:flutter/material.dart';

class MechanicShop {
  const MechanicShop({
    required this.name,
    required this.rating,
    required this.details,
    required this.icon,
  });

  final String name;
  final double rating;
  final String details;
  final IconData icon;
}
