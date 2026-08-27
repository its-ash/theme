import 'package:flutter/material.dart';

import 'shoe_model.dart';

class ShoeData {
  ShoeData._();

  static List<Shoe> shoes = [
    const Shoe(
      id: '1',
      name: 'Air Max Pulse',
      brand: 'Nike',
      price: 129.99,
      originalPrice: 159.99,
      description: 'The Air Max Pulse delivers bold style with the iconic Air cushioning. Featuring a breathable mesh upper and durable rubber outsole for everyday comfort.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#1976D2', '#000000', '#FFFFFF'],
      rating: 4.5,
      reviewCount: 234,
      isFeatured: true,
    ),
    const Shoe(
      id: '2',
      name: 'Ultraboost 22',
      brand: 'Adidas',
      price: 180.00,
      description: 'Responsive cushioning meets adaptive support. The Ultraboost 22 returns with a Primeknit upper and BOOST midsole for energy return.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#000000', '#FFFFFF', '#808080'],
      rating: 4.8,
      reviewCount: 512,
      isFeatured: true,
    ),
    const Shoe(
      id: '3',
      name: 'Gel-Kayano 28',
      brand: 'Asics',
      price: 160.00,
      originalPrice: 190.00,
      description: 'Stability meets comfort. The GEL-KAYANO 28 features improved GEL technology and a dynamic DuoMax support system.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#03DAC6', '#1976D2', '#000000'],
      rating: 4.6,
      reviewCount: 189,
      isFeatured: true,
    ),
    const Shoe(
      id: '4',
      name: 'Pegasus 40',
      brand: 'Nike',
      price: 140.00,
      description: 'The trusted trainer returns with React foam and a Zoom Air unit for a responsive, smooth ride.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#FF5722', '#FFFFFF', '#000000'],
      rating: 4.7,
      reviewCount: 421,
    ),
    const Shoe(
      id: '5',
      name: 'Fresh Foam X 1080v12',
      brand: 'New Balance',
      price: 165.00,
      description: 'Plush comfort for long runs. Fresh Foam X delivers a soft, smooth ride mile after mile.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#8BC34A', '#000000', '#FFFFFF'],
      rating: 4.9,
      reviewCount: 356,
      isFeatured: true,
    ),
    const Shoe(
      id: '6',
      name: 'Ghost 15',
      brand: 'Brooks',
      price: 140.00,
      description: 'A balanced ride with signature Brooks cushioning. The Ghost 15 is perfect for daily training.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#FFFFFF', '#1976D2', '#FFA726'],
      rating: 4.4,
      reviewCount: 178,
    ),
    const Shoe(
      id: '7',
      name: 'Clifton 9',
      brand: 'Hoka',
      price: 145.00,
      originalPrice: 175.00,
      description: 'Maximum cushioning with a lightweight frame. The Clifton 9 is the perfect everyday runner.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#E91E63', '#FFFFFF', '#000000'],
      rating: 4.7,
      reviewCount: 267,
    ),
    const Shoe(
      id: '8',
      name: 'Speedgoat 5',
      brand: 'Hoka',
      price: 155.00,
      description: 'Built for the trails. Vibram Megagrip outsole and PROFLY midsole for rugged terrain.',
      imageUrls: [],
      sizes: ['7', '8', '9', '10', '11', '12'],
      colors: ['#FF9800', '#000000', '#4CAF50'],
      rating: 4.8,
      reviewCount: 198,
      isFeatured: true,
    ),
  ];

  static List<String> categories = [
    'All',
    'Running',
    'Lifestyle',
    'Basketball',
    'Trail',
    'Training',
    'Skate',
  ];

  static List<Shoe> get featured => shoes.where((s) => s.isFeatured).toList();
  static List<Shoe> get onSale => shoes.where((s) => s.isOnSale).toList();

  static List<Order> orders = [
    Order(
      id: '10042',
      items: [
        CartItem(shoe: shoes[0], selectedSize: '10', selectedColor: const Color(0xFF1976D2), quantity: 1),
      ],
      total: 129.99,
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: OrderStatus.shipped,
    ),
    Order(
      id: '10038',
      items: [
        CartItem(shoe: shoes[1], selectedSize: '9', selectedColor: const Color(0xFF000000), quantity: 1),
        CartItem(shoe: shoes[3], selectedSize: '10', selectedColor: const Color(0xFFFF5722), quantity: 1),
      ],
      total: 320.00,
      date: DateTime.now().subtract(const Duration(days: 10)),
      status: OrderStatus.delivered,
    ),
    Order(
      id: '10035',
      items: [
        CartItem(shoe: shoes[4], selectedSize: '11', selectedColor: const Color(0xFF8BC34A), quantity: 1),
      ],
      total: 165.00,
      date: DateTime.now().subtract(const Duration(days: 20)),
      status: OrderStatus.processing,
    ),
  ];
}