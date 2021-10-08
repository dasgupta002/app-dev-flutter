import 'package:flutter/material.dart';
import '../theme/constants.dart';
import '../models/product.dart';

class Item extends StatelessWidget {
  final Product item;
  final VoidCallback handler;

  Item({ required this.item, required this.handler });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(17.0)
                  ),
                  child: Hero(
                    tag: "${item.id}",
                    child: Image.asset(item.image)
                  )
              )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(
                    item.name,
                    style: TextStyle(
                        color: lightColor
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                  '\Rs. ${item.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              )
            )
          ]
      )
    );
  }
}