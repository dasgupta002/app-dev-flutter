import 'package:flutter/material.dart';
import 'package:html_character_entities/html_character_entities.dart';

import './icon.dart';

class Tile extends StatelessWidget {
  final String answer;
  final bool selected;
  final bool correct;
  final bool display;
  final VoidCallback handler;
  
  Tile({ @required this.answer, @required this.selected, @required this.correct, @required this.display, @required this.handler });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handler,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 4.0
          )],
          border: Border.all(
            color: display ? (correct ? Colors.green : (selected ? Colors.red : Colors.white)) : Colors.white,
            width: 4.0
          ),
          borderRadius: BorderRadius.circular(100.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                HtmlCharacterEntities.decode(answer),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: display && correct ? FontWeight.bold : FontWeight.w400
                )
              )
            ),
            display ? (correct ? CircularIcon(icon: Icons.check, color: Colors.green) : (selected ? CircularIcon(icon: Icons.close, color: Colors.red) : SizedBox.shrink())) : SizedBox.shrink(),
          ]
        )
      )       
    );
  }
}