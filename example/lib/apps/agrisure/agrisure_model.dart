import 'package:flutter/material.dart';

class Seed {
  const Seed({
    required this.name,
    required this.category,
    required this.price,
    required this.unit,
    required this.description,
    required this.icon,
    required this.rating,
  });

  final String name;
  final String category;
  final double price;
  final String unit;
  final String description;
  final IconData icon;
  final double rating;
}

class CartLine {
  CartLine({required this.seed, this.quantity = 1});

  final Seed seed;
  int quantity;

  double get total => seed.price * quantity;
}

class AgriSureData {
  AgriSureData._();

  static const seeds = [
    Seed(
      name: 'Wheat Seeds',
      category: 'Grain',
      price: 45,
      unit: 'kg',
      description: 'High-yield winter wheat seeds bred for drought resistance and strong stalk strength. Ideal for temperate climates.',
      icon: Icons.grass,
      rating: 4.6,
    ),
    Seed(
      name: 'Basmati Rice',
      category: 'Grain',
      price: 60,
      unit: 'kg',
      description: 'Aromatic long-grain basmati rice seeds, well suited to flooded paddy fields with a 120-day maturity cycle.',
      icon: Icons.rice_bowl,
      rating: 4.8,
    ),
    Seed(
      name: 'Hybrid Maize',
      category: 'Grain',
      price: 55,
      unit: 'kg',
      description: 'Fast-maturing hybrid maize with strong resistance to leaf blight, suited for both grain and fodder use.',
      icon: Icons.agriculture,
      rating: 4.4,
    ),
    Seed(
      name: 'Tomato Seeds',
      category: 'Vegetable',
      price: 120,
      unit: '100g',
      description: 'Disease-resistant hybrid tomato variety producing firm, deep-red fruit ideal for both table and processing use.',
      icon: Icons.local_florist,
      rating: 4.5,
    ),
    Seed(
      name: 'Cotton Seeds',
      category: 'Cash Crop',
      price: 850,
      unit: 'kg',
      description: 'Bt cotton seeds with built-in pest resistance, bred for high fiber quality and consistent boll size.',
      icon: Icons.eco,
      rating: 4.3,
    ),
    Seed(
      name: 'Sunflower Seeds',
      category: 'Oilseed',
      price: 210,
      unit: 'kg',
      description: 'High oil-content sunflower hybrid with strong stalk support, suited for both irrigated and rain-fed farming.',
      icon: Icons.wb_sunny,
      rating: 4.7,
    ),
  ];
}
