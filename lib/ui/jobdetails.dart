//import 'dart:html';

import 'dart:core';

import 'package:dsc/ui/dashboard.dart';
import 'package:dsc/ui/job.dart';
import 'package:flutter/material.dart';
import 'package:dsc/constants/constants.dart';
import 'package:dsc/ui/widgets/custom_shape.dart';
import 'package:dsc/ui/widgets/customappbar.dart';
import 'package:dsc/ui/widgets/responsive_ui.dart';
import 'package:dsc/ui/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edge_alert/edge_alert.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobDetials extends StatefulWidget {
  @override
  _JobdetailsState createState() => _JobdetailsState();
}

class _JobdetailsState extends State<JobDetials> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool signingup = false;
  String jobname, location, vacancy, salary;
  final firestore = FirebaseFirestore.instance;

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
                // acceptTermsTextRow(),
                // SizedBox(
                //   height: _height / 35,
                // ),
                button(),
                // infoTextRow(),
                //socialIconsRow(),
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
                  colors: [Colors.blue[200], Colors.yellowAccent],
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
                  colors: [Colors.blue[200], Colors.yellowAccent],
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
                color: Colors.blue[900],
              )),
        ),
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
            SizedBox(height: _height / 30.0),
            //   lastNameTextFormField(),
            SecondNameTextFormField(),
            SizedBox(height: _height / 30.0),
            emailTextFormField(),
            SizedBox(height: _height / 30.0),
            phoneTextFormField(),
            SizedBox(height: _height / 20.0),
            // SizedBox(height: _height / 60.0),
            // passwordTextFormField(),
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
      icon: Icons.business_center_rounded,
      hint: "Job Name",
      userTyped: (val) {
        jobname = val;
      },
      // controller: name,
    );
  }

  // ignore: non_constant_identifier_names
  Widget SecondNameTextFormField() {
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
      keyboardType: TextInputType.number,
      icon: Icons.mobile_friendly,
      hint: "Salary",
      userTyped: (val) {
        salary = val;
      },
      // controller: name,
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
            keyboardType: TextInputType.text,
            icon: Icons.location_on,
            hint: "Location",
            userTyped: (val) {
              location = val;
            }
            //controller: email,
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
      icon: Icons.person,
      hint: "Vacancy",
      userTyped: (val) {
        vacancy = val;
      },
      // controller: phnum,
    );
  }

  // Widget passwordTextFormField() {
  //   return /*TextField(
  //     obscureText: true,
  //     decoration: InputDecoration(hintText: 'Password'),
  //     onChanged: (value) {
  //       setState(() {
  //         _password = value.trim();
  //       });
  //     },
  //   );*/
  //       CustomTextField(
  //           keyboardType: TextInputType.text,
  //           obscureText: true,
  //           icon: Icons.lock,
  //           hint: "Password",
  //           userTyped: (val) {
  //             _password = val;
  //           });
  // }

  // Widget acceptTermsTextRow() {
  //   return Container(
  //     margin: EdgeInsets.only(top: _height / 100.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Checkbox(
  //             activeColor: Colors.blue[400],
  //             value: checkBoxValue,
  //             onChanged: (bool newValue) {
  //               setState(() {
  //                 checkBoxValue = newValue;
  //               });
  //             }),
  //         Text(
  //           "I accept all terms and conditions",
  //           style: TextStyle(
  //               fontWeight: FontWeight.w600,
  //               fontSize: _large ? 12 : (_medium ? 13 : 10)),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget infoTextRow() {
  //   return Container(
  //     margin: EdgeInsets.only(top: _height / 40.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text(
  //           "Or create using social media",
  //           style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: _large ? 12 : (_medium ? 11 : 10)),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget socialIconsRow() {
  //   return Container(
  //     margin: EdgeInsets.only(top: _height / 80.0),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         GestureDetector(
  //           onTap: () async {
  //             EdgeAlert.show(context,
  //                 title: 'Signup Failed',
  //                 description: 'WE ADDING THIS FEATURE SOON',
  //                 gravity: EdgeAlert.BOTTOM,
  //                 icon: Icons.error,
  //                 backgroundColor: Colors.blue[400]);
  //             //  Navigator.of(context).pop(SIGN_IN);
  //             //  print("Routing to Sign up screen");
  //           },
  //           child: CircleAvatar(
  //             radius: 15,
  //             backgroundImage: AssetImage("assets/images/googlelogo.png"),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //         GestureDetector(
  //           onTap: () async {
  //             EdgeAlert.show(context,
  //                 title: 'Signup Failed',
  //                 description: 'WE ADDING THIS FEATURE SOON',
  //                 gravity: EdgeAlert.BOTTOM,
  //                 icon: Icons.error,
  //                 backgroundColor: Colors.blue[400]);
  //             //  Navigator.of(context).pop(SIGN_IN);
  //             //  print("Routing to Sign up screen");
  //           },
  //           child: CircleAvatar(
  //             radius: 15,
  //             backgroundImage: AssetImage("assets/images/fblogo.jpg"),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //         GestureDetector(
  //           onTap: () async {
  //             EdgeAlert.show(context,
  //                 title: 'Signup Failed',
  //                 description: 'WE ADDING THIS FEATURE SOON',
  //                 gravity: EdgeAlert.BOTTOM,
  //                 icon: Icons.error,
  //                 backgroundColor: Colors.blue[400]);
  //             // Navigator.of(context).pop(SIGN_IN);
  //             //  print("Routing to Sign up screen");
  //           },
  //           child: CircleAvatar(
  //             radius: 15,
  //             backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget signInTextRow() {
  //   return Container(
  //     margin: EdgeInsets.only(top: _height / 20.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text(
  //           "Already have an account?",
  //           style: TextStyle(fontWeight: FontWeight.w400),
  //         ),
  //         SizedBox(
  //           width: 5,
  //         ),
  //         GestureDetector(
  //           onTap: () {
  //             Navigator.of(context).pop(SIGN_IN);
  //             print("Routing to Sign up screen");
  //           },
  //           child: Text(
  //             "Sign in",
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w800,
  //                 color: Colors.blue[900],
  //                 fontSize: 19),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        if (jobname != null &&
            // _password != null &&
            location != null)
        //  &&
        // checkBoxValue == true)
        {
          setState(() {
            signingup = true;
          });
          try {
            // Map <String,dynamic> data= {"name":name.text,"email":email.text,"contact":phnum.text};
            //   FirebaseFirestore.instance.collection("users").doc("collection").set(data);

            // if (newUser != null) {
            firestore.collection("Job Details").add({
              "Job": jobname,
              "Salary": salary,
              "Location": location,
              "Vacancy": vacancy
            }).then((value) {
              print(value.id);
            });
            // .collection("users")
            // .doc("collection")
            // .set(data);
            // User updateUser = FirebaseAuth.instance.currentUser;
            // updateUser.updateProfile(displayName: name);
            // updateUser.updateProfile(photoURL: url);
            // updateUser.uid;
            // updateUser.displayName;
            // updateUser.phoneNumber;
            //await newUser.user.updateProfile(info);

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboard()));
            // }
          } catch (e) {
            setState(() {
              signingup = false;
            });
            EdgeAlert.show(context,
                title: 'Signup Failed',
                description: e.toString(),
                gravity: EdgeAlert.BOTTOM,
                icon: Icons.error,
                backgroundColor: Colors.blue[400]);
          }
        } else {
          EdgeAlert.show(context,
              title: 'Signup Failed',
              // description:
              //     'All fields are required. Accept all terms and conditions',
              gravity: EdgeAlert.BOTTOM,
              icon: Icons.error,
              backgroundColor: Colors.blue[400]);
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 2.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.blue[900], Colors.blueAccent[100]],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'APPLY',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }
} //end of signup