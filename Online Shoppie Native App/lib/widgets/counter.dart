import 'package:flutter/material.dart';
import '../theme/constants.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int buyables = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40.0,
          height: 33.0,
          child: OutlineButton(
            onPressed: () {
              if(buyables > 1) {
                setState(() {
                  buyables--;
                });
              }
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
            padding: EdgeInsets.zero,
            child: Icon(Icons.remove)
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            buyables.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6
          )
        ),
        SizedBox(
          width: 40.0,
          height: 33.0,
          child: OutlineButton(
              onPressed: () {
                setState(() {
                  buyables++;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
              padding: EdgeInsets.zero,
              child: Icon(Icons.add)
          )
        )
      ],
    );
  }
}