import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/constants.dart';
import '../models/product.dart';
import '../components/view.dart';

class Info extends StatelessWidget {
  final Product item;

  Info({ required this.item });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      appBar: AppBar(
        backgroundColor: item.color,
        elevation: 0,
        leading: IconButton(
            icon: SvgPicture.asset('assets/icons/back.svg'),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset('assets/icons/cart.svg'),
              color: Colors.white,
              onPressed: () {}
          ),
          IconButton(
              icon: SvgPicture.asset('assets/icons/search.svg'),
              color: Colors.white,
              onPressed: () {}
          ),
          SizedBox(width: defaultPadding / 2)
        ]
      ),
      body: View(gift: item)
    );
  }
}