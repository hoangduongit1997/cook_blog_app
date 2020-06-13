import 'package:flutter/material.dart';
import 'package:cookblog/custom_widgets/shadowButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookblog/Utils/authService.dart';
import 'package:cookblog/screens/emailScreen.dart';

class SignInScreen extends StatelessWidget {
  static String routeId = 'Sign_In_Screen';
  AuthHandler authenticationService = AuthHandler();
  createAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              "Google Sign In failed!",
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 20,
                color:Color(0xfff67300),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Your Google Sign In failed!'),
                  Text('Please try again with this or different account.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Dismiss',
                  style: TextStyle(
                    color:Color(0xfff67300),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF3EE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 57.5 , vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Welcome Back to the Cook Blog.\nGive a new dish to us!!",
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 32,
                color:Color(0xfff67300),
              ),
            ),
            new Container(
              height: 204.00,
              width: 272.00,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pizza.png"),
                ),
              ),
            ),
            ShadowButton(
              icon: FaIcon(FontAwesomeIcons.google , color: Color(0xfff67300) , size: 22.5),
              text: 'Sign In using ',
              textSize: 22.5,
              width: 220,
              height: 48,
              press: () async {
                bool result = await authenticationService.signInGoogle();
                if (!result) {
                  createAlertDialog(context);
                }
                else {
                  Navigator.pushNamed(context, 'Item_Screen');
                }
              }
            ),
            ShadowButton(
              icon: Icon(Icons.mail , color: Color(0xfff67300) , size: 22.5),
              text: 'Sign In using ',
              textSize: 22.5,
              width: 220,
              height: 48,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmailScreen(option: "Sign In")));
              },
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                "New to Cook Blog? Sign Up",
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

