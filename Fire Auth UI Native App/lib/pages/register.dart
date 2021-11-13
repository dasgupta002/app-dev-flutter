import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/data.dart';
import './home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Register to TGD and continue!',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.white, 
                  fontSize: 17.0
                )
              ),
              SizedBox(height: 22.0),
              Text(
                'Enter your email and password below to register an account to continue to TGD and let the fun of learning with us begin!',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.white, 
                  fontSize: 11.0
                )
              ),
              SizedBox(height: 50.0),
              _buildInputFields(mailController, Icons.account_circle, 'Email'),
              SizedBox(height: 14.0),
              _buildInputFields(keyController, Icons.lock, 'Password'),
              SizedBox(height: 14.0),
              MaterialButton(
                onPressed: () async {
                  try {
                    UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mailController.text, password: keyController.text);
          
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (error) {
                    if (error.code == 'weak-password') {
                      keyController.text = '';                    
                    } else if (error.code == 'email-already-in-use') {
                      mailController.text = '';
                    }
                  }
                },
                height: 40.0,
                minWidth: double.maxFinite,
                elevation: 0,
                textColor: Colors.white,
                color: logoColor,
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white
                  )
                )
              ),
              SizedBox(height: 14.0),
              MaterialButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                height: 40.0,
                minWidth: double.maxFinite,
                elevation: 0,
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(
                  'Have an account ready? Onboard now!',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white
                  )
                )
              ),
              SizedBox(height: 15.0)
            ]
          )
        )
      )
    );
  }

  _buildInputFields(TextEditingController controller, IconData icon, String key) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(
          color: Colors.blue
        )
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 11.0),
          labelText: key,
          labelStyle: TextStyle(
            color: Colors.white
          ),
          icon: Icon(
            icon,
            color: Colors.white
          ),
          border: InputBorder.none
        )
      )
    );
  }
}