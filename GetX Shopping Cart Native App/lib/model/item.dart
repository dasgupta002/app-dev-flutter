import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Item {
  final int ID;
  final String name;
  final String description;
  final String image;
  final double price;

  final favorite = false.obs;

  Item({ required this.ID, required this.name, required this.description, required this.image, required this.price });
}