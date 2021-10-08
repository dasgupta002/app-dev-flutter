import 'package:flutter/material.dart';

class Product {
  final String name;
  final String image;
  final String description;
  final int size;
  final int price;
  final int id;
  final Color color;

  Product({ required this.name, required this.image, required this.description, required this.size, required this.price, required this.id, required this.color });
}