import 'package:flutter/material.dart';
import '../models/product.dart';

List<Product> products = [
  Product(id: 1, name: 'Office Code', price: 237, size: 12, description: dummyText, image: "assets/images/bag_1.png", color: Color(0xFF3D82AE)),
  Product(id: 2, name: 'Belt Bag', price: 337, size: 9, description: dummyText, image: "assets/images/bag_2.png", color: Color(0xFFD3A984)),
  Product(id: 3, name: "Hang Top", price: 467, size: 10, description: dummyText, image: "assets/images/bag_3.png", color: Color(0xFF989493)),
  Product(id: 4, name: "Old Fashion", price: 669, size: 11, description: dummyText, image: "assets/images/bag_4.png", color: Color(0xFFE6B398)),
  Product(id: 5, name: "Office Code", price: 641, size: 12, description: dummyText, image: "assets/images/bag_5.png", color: Color(0xFFFB7883)),
  Product(id: 6, name: "Office Code", price: 389, size: 12, description: dummyText, image: "assets/images/bag_6.png", color: Color(0xFFAEAEAE))
];

String dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";