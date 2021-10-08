import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../theme/constants.dart';
import '../widgets/category.dart';
import '../widgets/item.dart';
import '../screens/info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
          child: Text(
            "Women's Accessories",
            style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold)
          )
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: defaultPadding, crossAxisSpacing: defaultPadding, childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                return Item(item: products[index], handler: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Info(item: products[index]);
                  }));
                });
              }
            )
          )
        )
      ]
    );
  }
}