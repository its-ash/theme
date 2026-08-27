import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

class Shoe {
  final String id;
  final String name;
  final String brand;
  final double price;
  final double? originalPrice;
  final String description;
  final List<String> imageUrls;
  final List<String> sizes;
  final List<String> colors;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final bool isFavorite;

  const Shoe({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    this.originalPrice,
    required this.description,
    required this.imageUrls,
    required this.sizes,
    required this.colors,
    this.rating = 0,
    this.reviewCount = 0,
    this.isFeatured = false,
    this.isFavorite = false,
  });

  bool get isOnSale => originalPrice != null && originalPrice! > price;

  Shoe copyWith({
    String? id,
    String? name,
    String? brand,
    double? price,
    double? originalPrice,
    String? description,
    List<String>? imageUrls,
    List<String>? sizes,
    List<String>? colors,
    double? rating,
    int? reviewCount,
    bool? isFeatured,
    bool? isFavorite,
  }) => Shoe(
    id: id ?? this.id,
    name: name ?? this.name,
    brand: brand ?? this.brand,
    price: price ?? this.price,
    originalPrice: originalPrice ?? this.originalPrice,
    description: description ?? this.description,
    imageUrls: imageUrls ?? this.imageUrls,
    sizes: sizes ?? this.sizes,
    colors: colors ?? this.colors,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    isFeatured: isFeatured ?? this.isFeatured,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}

class CartItem {
  final Shoe shoe;
  final String selectedSize;
  final Color selectedColor;
  final int quantity;

  const CartItem({
    required this.shoe,
    required this.selectedSize,
    required this.selectedColor,
    required this.quantity,
  });

  double get totalPrice => shoe.price * quantity;

  CartItem copyWith({int? quantity}) => CartItem(
    shoe: shoe,
    selectedSize: selectedSize,
    selectedColor: selectedColor,
    quantity: quantity ?? this.quantity,
  );
}

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime date;
  final OrderStatus status;

  const Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    required this.status,
  });
}

enum OrderStatus { processing, shipped, delivered, cancelled }

extension OrderStatusX on OrderStatus {
  String get label => switch (this) {
    OrderStatus.processing => 'Processing',
    OrderStatus.shipped => 'Shipped',
    OrderStatus.delivered => 'Delivered',
    OrderStatus.cancelled => 'Cancelled',
  };

  Color get color => switch (this) {
    OrderStatus.processing => const Color(0xFFFFA726),
    OrderStatus.shipped => AppColors.primaryLight,
    OrderStatus.delivered => const Color(0xFF4CAF50),
    OrderStatus.cancelled => const Color(0xFFEF5350),
  };
}
