import 'package:flutter/material.dart';
import 'package:cookblog/custom_widgets/shadowButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookblog/screens/signInScreen.dart';
import 'package:cookblog/screens/emailScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF3EE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.5 , vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Start the journey of your own food blogs with\nCook Blog  ",
              style: TextStyle(
                fontFamily: "Segoe UI Historic",
                fontSize: 32,
                color:Color(0xfff67300),
              ),
            ),
            new Container(
              height: 204.00,
              width: 272.00,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/omellete.png"),
                ),
              ),
            ),
            ShadowButton(
              icon: FaIcon(FontAwesomeIcons.google , color: Color(0xfff67300) , size: 22.5),
              text: 'Sign Up using ',
              textSize: 22.5,
              width: 220,
              height: 48,
              press: null,
            ),
            ShadowButton(
              icon: Icon(Icons.mail , color: Color(0xfff67300) , size: 22.5),
              text: 'Sign Up using ',
              textSize: 22.5,
              width: 220,
              height: 48,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmailScreen(option: "Sign Up")));
              },
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: Text(
                "Already have an account? Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 16.5,
                  color:Color(0xfff67300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
