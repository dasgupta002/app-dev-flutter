import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map> categories = [
  {'name': 'Cats', 'icon': 'images/cat.png'},
  {'name': 'Dogs', 'icon': 'images/dog.png'},
  {'name': 'Rabbits', 'icon': 'images/rabbit.png'},
  {'name': 'Parrot', 'icon': 'images/parrot.png'},
  {'name': 'Horses', 'icon': 'images/horse.png'},
];

List<Map> menu = [
  {'icon': FontAwesomeIcons.paw, 'tag': 'Adoption'},
  {'icon': Icons.money, 'tag': 'Donation'},
  {'icon': FontAwesomeIcons.plus, 'tag': 'Add pet'},
  {'icon': Icons.favorite, 'tag': 'Favourites'},
  {'icon': Icons.mail, 'tag': 'Messages'},
  {'icon': FontAwesomeIcons.userAlt, 'tag': 'Profile'},
];