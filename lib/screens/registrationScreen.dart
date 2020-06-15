import 'package:flutter/material.dart';
import 'package:cookblog/custom_widgets/shadowButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameControl = TextEditingController(text: "");
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  void getCurrentUser() async {
    user = await _auth.currentUser();
  }
  List<bool> check_value = [false , false ,false ,false ,false ,false ,false ,false ,false ,false , false ,false];
  List<String> available_cuisines = ['Continental' , 'Chinese' , 'Punjabi' , 'South Indian' , 'Thai','Goan' , 'Mughal' , 'Gujarati' , 'Rajasthani' , 'Maharashtarian' , 'Bengali' , 'North Indian'];
  List<String> favourite_cuisines = [];
  String _gender = "Male";
  Firestore _firestore = Firestore.instance;
  List<Widget> CheckBoxBuilder(){
    List<Widget> Check_List = [];
    for (int i = 0 ; i < 12 ; ++i){
      Check_List.add(CheckboxListTile(
        value: check_value[i],
        onChanged: (bool value){
          setState(() {
            check_value[i] = value;
            if(check_value[i] == true){
              favourite_cuisines.add(available_cuisines[i]);
            }
            else if(check_value[i] == false){
              favourite_cuisines.remove(available_cuisines[i]);
            }
          });
        },
        title: Text(available_cuisines[i] , style: TextStyle(fontFamily: 'Segeo UI' , fontSize: 17.5)),
        activeColor: Color(0xfff67300),
      ));
    }
    Check_List.add(
      ShadowButton(icon: Icon(Icons.arrow_forward , color: Color(0xfff67300) , size: 17.5) , text: "Let's Go!", textSize: 22.5, width: 210, height: 48, press: (){
        _firestore.collection('users').document(user.email).setData({
          'Name': _nameControl.text,
          'Gender': _gender,
          'Favourite Cuisines': favourite_cuisines,
        });
        _nameControl.dispose();
        Navigator.pushNamed(context, 'Item_Screen');
      })
    );
    return Check_List;
  }
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFFFCF3EE),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.5 , vertical: 5),
            child: new ListView(
                children: <Widget>[
                  SizedBox(height:25),
                  new Text(
                    "One more step...",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 35.5,
                      color:Color(0xfff67300),
                    ),
                  ),
                  SizedBox(height:25),
                  new Text(
                    "Let us know more about you!",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 22.5,
                      color:Color(0xfff67300),
                    ),
                  ),
                  SizedBox(height: 35),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new TextField(
                        controller: _nameControl,
                        decoration: InputDecoration(
                          hintText: "What should we call you?",
                          icon: Icon(Icons.spellcheck , color: Color(0xFFF67300) , size: 22.5),
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
                      new Text(
                        'Gender',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 20.5,
                          color:Color(0xfff67300),
                        ),
                      ),
                      SizedBox(height: 10),
                      new ListTile(
                          leading: Radio(
                            value: "Male",
                            groupValue: _gender,
                            onChanged: (value){
                              setState(() {
                                _gender = value;
                              });
                            },
                            activeColor: Color(0xFFF67300),
                          ),
                          title: Text('Male' , style: TextStyle(fontFamily: 'Segeo UI' , fontSize: 17.5)),
                      ),
                      new ListTile(
                        leading: Radio(
                          value: 'Female',
                          groupValue: _gender,
                          onChanged: (value){
                            setState(() {
                              _gender = value;
                            });
                          },
                          activeColor: Color(0xFFF67300),
                        ),
                        title: Text('Female' , style: TextStyle(fontFamily: 'Segeo UI' , fontSize: 17.5)),
                      ),
                      new ListTile(
                        leading: Radio(
                          value: "Prefer not to say",
                          groupValue: _gender,
                          onChanged: (value){
                            setState(() {
                              _gender = value;
                            });
                          },
                          activeColor: Color(0xFFF67300),
                        ),
                        title: Text('Prefer not to say' , style: TextStyle(fontFamily: 'Segeo UI' , fontSize: 17.5)),
                      ),
                      SizedBox(height: 20),
                      new Text(
                        'Favourite Cuisines',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 20.5,
                          color:Color(0xfff67300),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: CheckBoxBuilder(),
                  )
                ]
            )
        )
    );
  }
}
