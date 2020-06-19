import 'package:flutter/material.dart';
import 'package:cookblog/custom_widgets/shadowButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class NewRecipe extends StatefulWidget {
  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  File _imageFile;
  ImagePicker _picker = ImagePicker();
  String recipeName;
  String instructions;
  int dummy1 = null , dummy2 = null;
  Map<String , int> cooking_time = {
    "hours": 0,
    "minutes": 0
  };
  String ingredient_name = "";
  String ingredient_quantity = "";
  Map<String , String> ingredients = {};
  String recipe_cuisine;
  List<DropdownMenuItem<int>> makeNumberList(){
    List<DropdownMenuItem<int>> NumbersList = [];
    for(int i = 1 ; i <= 60 ; i++){
      var newNumber = DropdownMenuItem(
          value: i,
          child: Text("$i")
      );
      NumbersList.add(newNumber);
    }
    return NumbersList;
  }
  createAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              "Add Ingredient",
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 20,
                color:Color(0xfff67300),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    onChanged: (value){
                      setState(() {
                        ingredient_name = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Ingredient Name",
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    onChanged: (value){
                      setState(() {
                        ingredient_quantity = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Ingredient Quantity",
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color:Color(0xfff67300),
                  ),
                ),
                onPressed: () {
                  ingredients[ingredient_name] = ingredient_quantity;
                  print(ingredients);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await _picker.getImage(source: source);
    setState(() {
      _imageFile = File(selected.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFCF3EE),
        appBar: AppBar(
          backgroundColor: Color(0xFFFCF3EE),
          elevation: 2.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back , color: Color(0xFFF67300) , size: 25),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "New Recipe",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFFF67300) , fontSize: 25 )
                  ),
                  SizedBox(width: 2.5),
                  Icon(Icons.fastfood , color: Color(0xFFF67300) , size: 35)
                ],
              )
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 10),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              new TextField(
                onChanged: (value){
                  recipeName = value;
                },
                decoration: InputDecoration(
                  hintText: "Introduce us to new dish! ",
                  icon: FaIcon(FontAwesomeIcons.cocktail, color: Color(0xFFF67300) , size: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                    borderSide: BorderSide(color: Color(0xFFF67300) , width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.timelapse , color: Color(0xfff67300), size: 22.5),
                  SizedBox(width: 12.5),
                  new Text(
                    'Cooking Duration',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 18,
                      color:Color(0xfff67300),
                    ),
                  ),
                  SizedBox(width: 2.5),
                  new DropdownButton<int>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: <DropdownMenuItem<int>>[
                        DropdownMenuItem(
                            value: 0,
                            child: Text("0")
                        ),
                        DropdownMenuItem(
                            value: 1,
                            child: Text("1")
                        ),
                        DropdownMenuItem(
                            value: 2,
                            child: Text("2")
                        ),
                        DropdownMenuItem(
                            value: 3,
                            child: Text("3")
                        ),
                        DropdownMenuItem(
                            value: 4,
                            child: Text("4")
                        ),
                        DropdownMenuItem(
                            value: 5,
                            child: Text("5")
                        ),
                        DropdownMenuItem(
                            value: 6,
                            child: Text("6")
                        ),
                        DropdownMenuItem(
                            value: 7,
                            child: Text("2")
                        ),
                        DropdownMenuItem(
                            value: 8,
                            child: Text("8")
                        ),
                        DropdownMenuItem(
                            value: 9,
                            child: Text("9")
                        ),
                        DropdownMenuItem(
                            value: 10,
                            child: Text("10")
                        ),
                      ],
                      hint: Text('Hours'),
                      value: dummy1,
                      onChanged: (int value){
                        setState(() {
                          cooking_time["hours"] = value;
                          dummy1 = value;
                        });
                        print(cooking_time["hours"]);
                      }
                  ),
                  new DropdownButton<int>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: makeNumberList(),
                      value: dummy2,
                      hint: Text('Minutes'),
                      onChanged: (int value){
                        setState(() {
                          cooking_time["minutes"] = value;
                          dummy2 = value;
                        });
                        print(cooking_time["minutes"]);
                      }
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10),
                  Icon(Icons.location_city , color: Color(0xFFF67300) , size: 20),
                  SizedBox(width: 25),
                  DropdownButton<String>(
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: "Bengali",
                          child: Text("Bengali"),
                        ),
                        DropdownMenuItem(
                          value: "Chinese",
                          child: Text("Chinese"),
                        ),
                        DropdownMenuItem(
                          value: "Continental",
                          child: Text("Continental"),
                        ),
                        DropdownMenuItem(
                          value: "Goan",
                          child: Text("Goan"),
                        ),
                        DropdownMenuItem(
                          value: "Gujarati",
                          child: Text("Gujarati"),
                        ),
                        DropdownMenuItem(
                          value: "Maharashtrian",
                          child: Text("Maharashtrian"),
                        ),
                        DropdownMenuItem(
                          value: "Mughal",
                          child: Text("Mughal"),
                        ),
                        DropdownMenuItem(
                          value: "North Indian",
                          child: Text("North Indian"),
                        ),
                        DropdownMenuItem(
                          value: "Punjabi",
                          child: Text("Punjabi"),
                        ),
                        DropdownMenuItem(
                          value: "Rajasthani",
                          child: Text("Rajasthani"),
                        ),
                        DropdownMenuItem(
                          value: "Thai",
                          child: Text("Thai"),
                        ),
                        DropdownMenuItem(
                          value: "Others",
                          child: Text("Others"),
                        ),
                      ],
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: recipe_cuisine,
                      hint: Text("Tell us the cuisine of your recipe!"),
                      onChanged: (value){
                        setState(() {
                          recipe_cuisine = value;
                        });
                      }
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  ShadowButton(
                      text: "Add Ingredients",
                      icon: Icon(Icons.add_circle_outline , color: Color(0xFFF67300) , size: 20.5),
                      textSize: 18.5,
                      width: 170,
                      height: 40,
                      press: (){
                        createAlertDialog(context);
                      }
                  ),
                  GestureDetector(
                    child: Chip(
                      label: Text(
                          "Remove all",
                          style: TextStyle(
                            color: Color(0xFFF67300),
                            fontSize: 13.5,
                            fontFamily: 'Segoe UI',
                          )
                      ),
                      avatar: Icon(Icons.cancel , color: Color(0xFFF67300)),
                      backgroundColor: Color(0xFFFCF3EE),
                      elevation: 3.5,
                      shadowColor: Color(0xFFF67300),
                    ),
                    onTap: (){
                      setState(() {
                        ingredients = {};
                        ingredient_name = "";
                        ingredient_quantity = "";
                      });
                      print(ingredients);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Added $ingredient_quantity amount of $ingredient_name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF67300),
                  fontSize: 17.5,
                  fontFamily: "Segoe UI",
                ),
              ),
              SizedBox(height: 20),
              new TextField(
                keyboardType: TextInputType.multiline,
                onChanged: (value){
                  instructions = value;
                },
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: "Cooking Instructions",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                    borderSide: BorderSide(color: Color(0xFFF67300) , width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ShadowButton(
                  text: "Pick Image",
                  icon: Icon(Icons.image , color: Color(0xFFF67300) , size: 25),
                  textSize: 22.5,
                  width: 225,
                  height: 40,
                  press: (){
                    _pickImage(ImageSource.gallery);
                  }
              ),
              SizedBox(height: 20),
              Uploader(file: _imageFile , recipeName: recipeName , instructions: instructions , ingredients: ingredients , duration: cooking_time , recipeCuisine: recipe_cuisine),
              SizedBox(height: 20),
            ],
          ),
        )
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;
  String recipeName;
  String instructions;
  Map<String , String> ingredients;
  Map<String , int> duration;
  String recipeCuisine;
  Uploader({@required this.file , @required this.recipeName , @required this.instructions , @required this.ingredients , @required this.duration , @required this.recipeCuisine});
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  Firestore _firestore = Firestore.instance;
  String url;
  final FirebaseStorage _storage = FirebaseStorage(storageBucket: "gs://cook-blog-83f55.appspot.com");
  StorageUploadTask _uploadTask;
  void getCurrentUser() async {
    user = await _auth.currentUser();
  }
  void postRecipe(String recipeName , String instructions, Map<String , String> ingredients , Map<String , int> duration , String recipe_cuisine) async {
    String filePath = 'RecipeImages/$recipeName-${DateTime.now()}.png';
    StorageReference reference = _storage.ref().child(filePath);
    setState(() {
      _uploadTask = reference.putFile(widget.file);
    });
    try{
      url = (await (await _uploadTask.onComplete).ref.getDownloadURL()).toString();
      print(url);
    }
    catch(error){
      print(error);
    }
    final userData = await _firestore.collection("users").getDocuments();
    String UserName = "";
    for(var users in userData.documents){
      if(users.documentID == user.email){
        UserName = users.data["Name"];
        break;
      }
    }
    _firestore.collection("recipes").document(recipeName).setData({
      "Name": recipeName,
      "Cook Name": UserName,
      "Cooking Duration": duration,
      "Cuisine": recipe_cuisine,
      "Ingredients": ingredients,
      "Instructions": instructions,
      "imageURL": url,
      "Likes": 0,
      "Avg Rating": 3.5,
      "Post Time": DateTime.now(),
    });
    _firestore.collection("cuisines").document(recipe_cuisine).collection("recipes").document(recipeName).setData({
      "Name": recipeName,
      "Cook Name": UserName,
      "Cooking Duration": duration,
      "Cuisine": recipe_cuisine,
      "Ingredients": ingredients,
      "Instructions": instructions,
      "imageURL": url,
      "Likes": 0,
      "Avg Rating": 3.5,
      "Post Time": DateTime.now(),
    });
  }
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    if(_uploadTask != null){
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context , snapshot){
            var event = snapshot?.data?.snapshot;
            double progressPercent = event != null ? event.bytesTransferred/event.totalByteCount : 0;
            return Column(
              children: <Widget>[
                if(_uploadTask.isComplete)
                  Text(
                    "Recipe Upload Successful",
                    style: TextStyle(
                      color: Color(0xFFF67300),
                      fontSize: 17.5,
                      fontFamily: "Segoe UI",
                    ),
                  ),
                LinearProgressIndicator(value: progressPercent),
                Text(
                  "${(progressPercent*100).toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0xFFF67300),
                    fontSize: 17.5,
                    fontFamily: "Segoe UI",
                  ),
                ),
              ],
            );
          }
      );
    }
    else{
      return ShadowButton(
          text: "Post Recipe",
          textSize: 22.5,
          width: 225,
          height: 40,
          press:  (){
            postRecipe(widget.recipeName, widget.instructions, widget.ingredients, widget.duration, widget.recipeCuisine);
            DocumentReference recipeReference = _firestore.collection("recipes").document("${widget.recipeName}");
            _firestore.collection("users").document(user.email).collection("My Recipes").document("${widget.recipeName}").setData({
              "Reference": recipeReference,
            });
          },
          icon: Icon(Icons.send , color: Color(0xFFF67300) , size: 20.5));
    }
  }
}

//  void postRecipeReference(String recipeName){

//  }