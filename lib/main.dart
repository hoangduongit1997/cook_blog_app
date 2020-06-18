import 'package:cookblog/screens/favouriteRecipes.dart';
import 'package:cookblog/screens/newRecipeScreen.dart';
import 'package:cookblog/screens/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:cookblog/screens/mainScreen.dart';
import 'package:cookblog/screens/signInScreen.dart';
import 'package:cookblog/screens/signUpScreen.dart';
import 'package:cookblog/screens/itemsScreen.dart';
import 'package:cookblog/screens/userProfile.dart';
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
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthCheck(),
      routes: {
        'Main_Screen': (context)=>MainScreen(),
        'Sign_Up_Screen': (context)=>SignUpScreen(),
        'Sign_In_Screen': (context)=>SignInScreen(),
        'Item_Screen': (context)=>ItemScreen(),
        'Regis_Screen': (context)=>RegistrationScreen(),
        'New_Recipe': (context)=>NewRecipe(),
        'user_Details': (context)=>UserProfile(),
        'user_favs': (context)=>FavouriteRecipes(),
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


