import 'package:cookblog/screens/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:cookblog/screens/mainScreen.dart';
import 'package:cookblog/screens/signInScreen.dart';
import 'package:cookblog/screens/signUpScreen.dart';
import 'package:cookblog/screens/itemsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthCheck(),
      routes: {
        'Main_Screen': (context)=>MainScreen(),
        'Sign_Up_Screen': (context)=>SignUpScreen(),
        'Sign_In_Screen': (context)=>SignInScreen(),
        'Item_Screen': (context)=>ItemScreen(),
      },
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context , AsyncSnapshot<FirebaseUser> snapshot){
        if(snapshot.data == null){
          return MainScreen();
        }
        else{
          return ItemScreen();
        }
      },
    );
  }
}


