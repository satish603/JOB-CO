import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc/ui/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc/ui/widgets/custom_shape.dart';
import 'package:dsc/ui/widgets/customappbar.dart';
import 'package:dsc/ui/widgets/responsive_ui.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dsc/ui/widgets/textformfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Shop1 extends StatefulWidget {
  @override
  _Shop1 createState() => _Shop1();
}

class _Shop1 extends State<Shop1> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;
  bool value10 = false;
  bool value11 = false;
  bool value12 = false;
  String status,status2, status3, status4, status5, status6;

  @override
  Widget build(BuildContext context) {
    // to get size

    //var size = MediaQuery.maybeOf(context).size;
    // style
   Widget stat() {
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
        hint: "Approve/Reject",
        userTyped: (val) {
          status = val;
        },
        // controller: name,
      );
    }Widget stat2() {
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
        hint: "Approve/Reject",
        userTyped: (val) {
          status2 = val;
        },
        // controller: name,
      );
    }Widget stat3() {
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
        hint: "Approve/Reject",
        userTyped: (val) {
          status3 = val;
        },
        // controller: name,
      );
    }Widget stat4() {
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
        hint: "Approve/Reject",
        userTyped: (val) {
          status4 = val;
        },
        // controller: name,
      );
    }Widget stat5() {
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
        hint: "Approve/Reject",
        userTyped: (val) {
          status5 = val;
        },
        // controller: name,
      );
    }
Widget stat6() {
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
        hint: "Approve/Reject",
        userTyped: (val) {
          status6 = val;
        },
        // controller: name,
      );
    }

    Widget button() {
      return RaisedButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Dashboard()));
            // }
          },
          textColor: Colors.white,
          padding: EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
//        height: _height / 20,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              gradient: LinearGradient(
                colors: <Color>[Colors.blue[900], Colors.blueAccent[100]],
              ),
            ),
            padding: const EdgeInsets.all(7.0),
            child: Text(
              'UPDATE',textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10,
              ),
            ),
          ));
    }

    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));
    return Scaffold(
      // body: Stack(
      // children: <Widget>[
      backgroundColor: Colors.indigo[900],
      // Container(

      //   decoration: BoxDecoration(
      //     image: DecorationImage(

      //         image: AssetImage('assets/images/top_header.jpg'),
      //         fit: BoxFit.fill),

      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('Applicants',
                  style: TextStyle(fontSize: 30, color: Colors.white)),

              /*Container(
                height: 64,
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/images/download.jpg'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                         '${user.displayName}' ,
                          style: TextStyle(
                              fontFamily: "Montserrat Medium",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          '${user.email}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: "Montserrat Regular"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignInPage()),
                          (Route<dynamic> route) => false);
                    },
                    
                  )),*/
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // alignment: Alignment.topRight,

                          Image.asset('assets/images/download.jpg', height: 28),

                          Text(
                            'ApplicantName_1',
                            style: cardTextStyle,
                          ),
                          stat(),
                          SizedBox(height: 15.0),button()
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/download.jpg',
                            height: 28,
                          ),
                          Text(
                            'ApplicantName_2',
                            style: cardTextStyle,
                          ),
                          stat2(),
                          SizedBox(height: 15.0),button()
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/download.jpg',
                            height: 28,
                          ),
                          Text(
                            'ApplicantName_3',
                            style: cardTextStyle,
                          ),
                          stat3(),
                          SizedBox(height: 15.0),button()
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/download.jpg',
                            height: 28,
                          ),
                          Text(
                            'ApplicantName_4',
                            style: cardTextStyle,
                          ),
                          stat4(),
                          SizedBox(height: 15.0),button()
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/download.jpg',
                            height: 28,
                          ),
                          Text(
                            'ApplicantName_5',
                            style: cardTextStyle,
                          ),
                          stat5(),
                          SizedBox(height: 15.0),button()
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/download.jpg',
                            height: 28,
                          ),
                          Text(
                            'ApplicantName_6',
                            style: cardTextStyle,
                          ),
                          stat6(),
                          SizedBox(height: 15.0),button()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // ignore: dead_code
  }
}
