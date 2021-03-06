//import 'dart:html';

import 'package:dsc/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:dsc/constants/constants.dart';
import 'package:dsc/ui/widgets/custom_shape.dart';
import 'package:dsc/ui/widgets/customappbar.dart';
import 'package:dsc/ui/widgets/responsive_ui.dart';
import 'package:dsc/ui/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

/*class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;

  CustomTextField({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
    void Function(String) onChanged,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.orange[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}*/

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool signingup = false;
  // var name, email, photoUrl, uid, emailVerified, phnum;
  String _email, _password, url;
  final auth = FirebaseAuth.instance;
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phnum = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                infoTextRow(),
                socialIconsRow(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: () {
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 31),
                color: Colors.orange[200],
              )),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            //   lastNameTextFormField(),
            //    SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return /*TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: 'First Name'),
      onChanged: (value) {
        setState(() {
          name = value.trim();
        });
      },
    );*/
        CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Full Name",
      userTyped: (val) {
        name = val;
      },
      controller: name,
    );
  }

  /* Widget lastNameTextFormField() {
    return /*TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: 'Last Name'),
      onChanged: (value) {
        setState(() {
          _lname = value.trim();
        });
      },
    );*/
        CustomTextField(
            keyboardType: TextInputType.text,
            icon: Icons.person,
            hint: "Last Name",
            userTyped: (val) {
              name = val;
            });
  }*/

  Widget emailTextFormField() {
    return /*TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: 'Email'),
      onChanged: (value) {
        setState(() {
          _email = value.trim();
        });
      },
    );*/
        CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
      userTyped: (val) {
        _email = val;
      },
      controller: email,
    );
  }

  Widget phoneTextFormField() {
    return /*TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: 'Phone Number'),
      onChanged: (value) {
        setState(() {
          phnum = value.trim();
        });
      },
    );*/
        CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number(OPTIONAL)",
      userTyped: (val) {
        phnum = val;
      },
      controller: phnum,
    );
  }

  Widget passwordTextFormField() {
    return /*TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'Password'),
      onChanged: (value) {
        setState(() {
          _password = value.trim();
        });
      },
    );*/
        CustomTextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            icon: Icons.lock,
            hint: "Password",
            userTyped: (val) {
              _password = val;
            });
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              EdgeAlert.show(context,
                  title: 'Signup Failed',
                  description: 'WE ADDING THIS FEATURE SOON',
                  gravity: EdgeAlert.BOTTOM,
                  icon: Icons.error,
                  backgroundColor: Colors.orange[200]);
              //  Navigator.of(context).pop(SIGN_IN);
              //  print("Routing to Sign up screen");
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/googlelogo.png"),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () async {
              EdgeAlert.show(context,
                  title: 'Signup Failed',
                  description: 'WE ADDING THIS FEATURE SOON',
                  gravity: EdgeAlert.BOTTOM,
                  icon: Icons.error,
                  backgroundColor: Colors.orange[200]);
              //  Navigator.of(context).pop(SIGN_IN);
              //  print("Routing to Sign up screen");
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/fblogo.jpg"),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () async {
              EdgeAlert.show(context,
                  title: 'Signup Failed',
                  description: 'WE ADDING THIS FEATURE SOON',
                  gravity: EdgeAlert.BOTTOM,
                  icon: Icons.error,
                  backgroundColor: Colors.orange[200]);
              // Navigator.of(context).pop(SIGN_IN);
              //  print("Routing to Sign up screen");
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        if (name != null &&
            _password != null &&
            _email != null &&
            checkBoxValue == true) {
          setState(() {
            signingup = true;
          });
          try {
            final newUser = await auth.createUserWithEmailAndPassword(
                email: _email, password: _password);
            // Map <String,dynamic> data= {"name":name.text,"email":email.text,"contact":phnum.text};
            //   FirebaseFirestore.instance.collection("users").doc("collection").set(data);

            if (newUser != null) {
              Map<String, dynamic> data = {
                "name": name.text,
                "email": email.text,
                "contact": phnum.text
              };
              FirebaseFirestore.instance
                  .collection("users")
                  .doc("collection")
                  .set(data);
              // User updateUser = FirebaseAuth.instance.currentUser;
              // updateUser.updateProfile(displayName: name);
              // updateUser.updateProfile(photoURL: url);
              // updateUser.uid;
              // updateUser.displayName;
              // updateUser.phoneNumber;
              //await newUser.user.updateProfile(info);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Dashboard()));
            }
          } catch (e) {
            setState(() {
              signingup = false;
            });
            EdgeAlert.show(context,
                title: 'Signup Failed',
                description: e.toString(),
                gravity: EdgeAlert.BOTTOM,
                icon: Icons.error,
                backgroundColor: Colors.orange[200]);
          }
        } else {
          EdgeAlert.show(context,
              title: 'Signup Failed',
              description:
                  'All fields are required. Accept all terms and conditions',
              gravity: EdgeAlert.BOTTOM,
              icon: Icons.error,
              backgroundColor: Colors.orange[200]);
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }
} //end of signup
