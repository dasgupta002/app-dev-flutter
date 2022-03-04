import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/card.dart';
import '../controller/shop.dart';
import '../controller/cart.dart';

class Home extends StatelessWidget {
  final _controller = Get.put(shopController());
  final _cart = Get.put(cartController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: _controller.products.length,
                  itemBuilder: (context, index) {
                    return ItemCard(data: _controller.products[index], controller: _cart);
                  }
                );
              })
            ),
            Obx(() {
              return Text(
                'Total amount:  \$ ' + _cart.total.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                )
              );
            }),
            SizedBox(height: 100.0)
          ]
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Obx(() {
          return Text(
            _cart.count.toString(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.black
            )
          );
        }),
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black
        )
      )
    );
  }
}