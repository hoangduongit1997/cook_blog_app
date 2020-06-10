import 'package:flutter/material.dart';
import 'package:cookblog/custom_widgets/recipeCard.dart';
import 'package:cookblog/custom_widgets/RecipeTag.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF3EE),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF3EE),
        elevation: 2.5,
        leading: IconButton(
          icon: Icon(Icons.sort , color: Color(0xFFF67300) , size: 35),
          onPressed: null,
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(32.5, 7.5, 2.5, 5),
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
