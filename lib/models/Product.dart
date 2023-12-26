import 'package:flutter/material.dart';

class Product {
  final int id;
  final String tag;
  final String name, title, description;
  final List<String> images;
  final String image;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.tag,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    this.name = '',
    this.image = '',
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    tag: 'cp_1.jpg',
    images: [
      "assets/images/cp_1.jpg",
      // "assets/images/ps4_console_white_2.png",
      // "assets/images/ps4_console_white_3.png",
      // "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Winter Warm",
    price: 10,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    tag: 'cp_2.jpg',
    images: [
      "assets/images/cp_2.jpg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Hafiz",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    tag: 'cp_3.jpg',
    images: [
      "assets/images/cp_3.jpg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Shelters",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    tag: 'cp_4.jpg',
    images: [
      "assets/images/cp_4.jpg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Water",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  )
];

const String description =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec feugiat metus. Integer mattis sollicitudin libero, vel maximus erat lacinia vitae.";
