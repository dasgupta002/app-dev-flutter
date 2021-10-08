import 'package:flutter/material.dart';
import '../theme/constants.dart';
import '../widgets/left.dart';
import '../widgets/right.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  double _BMI = 0;
  String _remarks = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(
                  color: accentColor, 
                  fontWeight: FontWeight.w300
                ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _height,
                      style: TextStyle(
                          fontSize: 33.0,
                          fontWeight: FontWeight.w300,
                          color: accentColor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 33.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weight,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w300,
                          color: accentColor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_height.text);
                  double _w = double.parse(_weight.text);
                  setState(() {
                    _BMI = _w / (_h * _h);
                    if(_BMI > 25){
                      _remarks = "You're over weight.";
                    } else if(_BMI >= 18.5 && _BMI <= 25){
                      _remarks = "You're normal weight.";
                    }else{
                      _remarks = "You're under weight.";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentColor
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Text(
                  _BMI.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 60, 
                    color: accentColor
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Visibility(
                visible: _remarks.isNotEmpty,
                  child: Container(
                child: Text(
                  _remarks,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: accentColor
                  ),
                ),
              )),
              SizedBox(height: 20.0),
              LeftBar(width: 40),
              SizedBox(height: 20.0),
              LeftBar(width: 70),
              SizedBox(height: 20.0),
              LeftBar(width: 40),
              SizedBox(height: 20.0),
              RightBar(width: 70),
              SizedBox(height: 20.0),
              RightBar(width: 70),
            ],
          ),
        )
    );
  }
}