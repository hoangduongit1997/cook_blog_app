import 'package:flutter/material.dart';
import 'package:cookblog/custom_widgets/recipeCard.dart';
import 'package:cookblog/custom_widgets/RecipeTag.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cookblog/screens/signUpScreen.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFCF3EE),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF3EE),
        elevation: 2.5,
        leading: IconButton(
          icon: Icon(Icons.sort , color: Color(0xFFF67300) , size: 35),
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "What's Hot",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFF67300) , fontSize: 25 )
              ),
              SizedBox(width: 2.5),
              Icon(Icons.whatshot , color: Color(0xFFF67300) , size: 35)
            ],
          )
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search , color: Color(0xFFF67300) , size: 35),
            onPressed: null,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer_wallpaper.jpg"),
                ),
              ),
              child: Text(
                'The Cook Blog',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Your favourites'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: (){
               _auth.signOut();
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SignUpScreen()), (route) => false);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, 'New_Recipe');
          },
          child: Icon(Icons.playlist_add),
          tooltip: 'Give us a new recipe!'
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15 , top: 5 , right: 7.5 , bottom: 5),
        child: Container(
          child: ListView(
            children: <Widget>[
              RecipeCard(
                recipe: "Capsicum pizza with tabasco sauce",
                dishImage: "",
                cookName: "Tanish Agrawal",
                openFunc: null,
                ratingFunc: null,
                tagList: <Widget>[
                  RecipeTag(
                    tagName: "Indian",
                  )
                ],
              ),
              SizedBox(height: 10),
              RecipeCard(
                recipe: "Kadhai Paneer",
                dishImage: "",
                cookName: "Vrishabh Agamya",
                openFunc: null,
                ratingFunc: null,
                tagList: <Widget>[
                  RecipeTag(
                    tagName: "Indian",
                  )
                ],
              ),
              SizedBox(height: 10),
              RecipeCard(
                recipe: "Kadhai Paneer",
                dishImage: "",
                cookName: "Vrishabh Agamya",
                openFunc: null,
                ratingFunc: null,
                tagList: <Widget>[
                  RecipeTag(
                    tagName: "Indian",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
