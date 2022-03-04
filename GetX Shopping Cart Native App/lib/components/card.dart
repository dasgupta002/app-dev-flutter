import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/item.dart';

class ItemCard extends StatelessWidget {
  final Item data;
  final controller;

  ItemCard({required this.data, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.name, 
                      style: TextStyle(
                        fontSize: 18.0
                      )
                    ),
                    Text(
                      data.description,
                      style: TextStyle(
                        fontSize: 11.0
                      )
                    )
                  ]
                ),
                Text(
                  data.price.toString(),
                  style: TextStyle(
                    fontSize: 18.0
                  )
                )
              ]
            ),
            SizedBox(height: 11.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    controller.addtoCart(data);
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.white
                    ),
                    primary: Colors.blue
                  ),
                  child: Text(
                    'Add to Cart'
                  )
                ),
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      data.favorite.isTrue ? Icons.favorite : Icons.favorite_border,
                      color: data.favorite.isTrue ? Colors.red : Colors.grey
                    ),
                    onPressed: () {
                      data.favorite.toggle();
                    }
                  );
                })
              ]
            )
          ]
        )
      )
    );
  }
}