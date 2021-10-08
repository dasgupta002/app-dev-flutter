import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/constants.dart';
import '../models/product.dart';
import '../widgets/counter.dart';

class View extends StatelessWidget {
  final Product gift;

  View({ required this.gift });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: EdgeInsets.only(top: size.height * 0.07, left: defaultPadding, right: defaultPadding),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Color"),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        width: 25.0,
                                        height: 25.0,
                                        margin: EdgeInsets.only(top: defaultPadding / 4, right: defaultPadding / 2),
                                        padding: EdgeInsets.all(2.5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Color(0xFF356C95)
                                            )
                                        ),
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF356C95)
                                            )
                                        )
                                    ),
                                    Container(
                                        width: 25.0,
                                        height: 25.0,
                                        margin: EdgeInsets.only(top: defaultPadding / 4, right: defaultPadding / 2),
                                        padding: EdgeInsets.all(2.5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.transparent
                                            )
                                        ),
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFF8C078)
                                            )
                                        )
                                    ),
                                    Container(
                                        width: 25.0,
                                        height: 25.0,
                                        margin: EdgeInsets.only(top: defaultPadding / 4, right: defaultPadding / 2),
                                        padding: EdgeInsets.all(2.5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.transparent
                                            )
                                        ),
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFA29B9B)
                                            )
                                        )
                                    )
                                  ]
                                )
                              ]
                            )
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: textColor
                                ),
                                children: <InlineSpan>[
                                  TextSpan(text: "Size\n"),
                                  TextSpan(
                                    text: "${gift.size} cm",
                                    style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)
                                  )
                                ]
                              )
                            )
                          )
                        ]
                      ),
                      SizedBox(height: defaultPadding / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Text(gift.description)
                      ),
                      SizedBox(height: defaultPadding / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Cart(),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF6464),
                              shape: BoxShape.circle
                            ),
                            child: SvgPicture.asset('assets/icons/heart.svg')
                          )
                        ]
                      ),
                      SizedBox(height: defaultPadding / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 60.0,
                              margin: EdgeInsets.only(right: defaultPadding),
                              decoration: BoxDecoration(
                                border: Border.all(color: gift.color),
                                borderRadius: BorderRadius.circular(18.0)
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/add_to_cart.svg',
                                  color: gift.color
                                ),
                                onPressed: () {}
                              )
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 50.0,
                                child: FlatButton(
                                  color: gift.color,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                                  child: Text(
                                    "BUY NOW",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  onPressed: () {}
                                )
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Aristocratic Hand Bag',
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                      Text(
                        gift.name,
                        style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(width: defaultPadding),
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: <InlineSpan>[
                                TextSpan(text: "Price"),
                                TextSpan(
                                    text: "\nRs. ${gift.price}",
                                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                                )
                              ]
                            )
                          ),
                          SizedBox(width: defaultPadding),
                          Expanded(
                            child: Hero(
                              tag: "${gift.id}",
                              child: Image.asset(
                                gift.image,
                                fit: BoxFit.fitWidth
                              ),
                            )
                          )
                        ]
                      )
                    ]
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}