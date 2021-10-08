import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/constants.dart';
import '../components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg'),
          onPressed: () {}
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                'assets/icons/cart.svg',
                color: textColor
              ),
              onPressed: () {}
          ),
          IconButton(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                color: textColor,
              ),
              onPressed: () {}
          ),
          SizedBox(width: defaultPadding / 2)
        ]
      ),
      body: Body()
    );
  }
}