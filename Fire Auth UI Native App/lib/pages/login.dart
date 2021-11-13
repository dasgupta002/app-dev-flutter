import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/data.dart';
import './register.dart';
import './home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();

  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  final GoogleSignIn googleCheck = GoogleSignIn();

  Future<User?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleAccount = await googleCheck.signIn();
    final GoogleSignInAuthentication? auth = await googleAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(accessToken: auth?.accessToken, idToken: auth?.idToken);
    final UserCredential userData = await fireAuth.signInWithCredential(credential);

    final User? user = userData.user;
    return user;
  }

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
                'Sign in to TGD and continue!',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.white, 
                  fontSize: 18.0
                )
              ),
              SizedBox(height: 22.0),
              Text(
                'Enter your email and password below to sign-in to continue to TGD and let the fun of learning with us begin!',
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
                    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: mailController.text, password: keyController.text);
          
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return Home(user: credential.user);
                    }));
                  } on FirebaseAuthException catch (error) {
                    if (error.code == 'user-not-found') {
                      Navigator.of(context).pop();
                    } else if (error.code == 'wrong-password') {
                      Navigator.of(context).pop();
                    }
                  }
                },
                height: 40.0,
                minWidth: double.maxFinite,
                elevation: 0,
                textColor: Colors.white,
                color: logoColor,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white
                  )
                )
              ),
              SizedBox(height: 14.0),
              MaterialButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Register();
                  }));
                },
                height: 40.0,
                minWidth: double.maxFinite,
                elevation: 0,
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(
                  "Don't have an account? Onborad now!",
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.white
                  )
                )
              ),
              SizedBox(height: 14.0),
              MaterialButton(
                onPressed: () async {
                  User? user =  await _signInWithGoogle();
          
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Home(user: user);
                  }));
                },
                height: 40.0,
                minWidth: double.maxFinite,
                elevation: 0,
                textColor: Colors.white,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google),
                    SizedBox(width: 11.0),
                    Text(
                      'Sign-in using Google',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white
                      )
                    )     
                  ]
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
          contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
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