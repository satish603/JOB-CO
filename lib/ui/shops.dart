import 'package:dsc/ui/applynow.dart';
import 'package:dsc/ui/contactus.dart';

import 'package:dsc/ui/job.dart';
import 'package:dsc/ui/jobdetails.dart';
import 'package:dsc/ui/shops.dart';
import 'package:dsc/ui/signin.dart';
import 'package:dsc/ui/signup.dart';
import 'package:dsc/ui/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

  @override
  Widget build(BuildContext context) {
    // to get size

    //var size = MediaQuery.maybeOf(context).size;
    // style
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
              
                       Text('Applicants', style: TextStyle(fontSize: 30,color:Colors.white)),
                    
                    
                 
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
                            ),Checkbox( 
                                      activeColor: Colors.greenAccent,
                                      checkColor: Colors.redAccent,
                                      value: this.value11,
                                      onChanged: (bool value_10) {
                                        setState(() {
                                          this.value11=value_10;
                                        });
                                      },
                                      
                                    ),
                                    Checkbox(
                                      activeColor: Colors.redAccent,
                                      checkColor: Colors.greenAccent,
                                      value: this.value12,
                                      onChanged: (bool value_11) {
                                        setState(() {
                                          this.value12=value_11;
                                        });
                                      },
                                      
                                    ),
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
                            ),Checkbox(
                                      activeColor: Colors.greenAccent,
                                      checkColor: Colors.redAccent,
                                      value: this.value9,
                                      onChanged: (bool value_8) {
                                        setState(() {
                                          this.value9=value_8;
                                        });
                                      },
                                      
                                    ),
                                    Checkbox(
                                      activeColor: Colors.redAccent,
                                      checkColor: Colors.greenAccent,
                                      value: this.value10,
                                      onChanged: (bool value_9) {
                                        setState(() {
                                          this.value10=value_9;
                                        });
                                      },
                                      
                                    ),
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
                            Checkbox(
                                      activeColor: Colors.greenAccent,
                                      checkColor: Colors.redAccent,
                                      value: this.value7,
                                      onChanged: (bool value_6) {
                                        setState(() {
                                          this.value7=value_6;
                                        });
                                      },
                                      
                                    ),
                                    Checkbox(
                                      activeColor: Colors.redAccent,
                                      checkColor: Colors.greenAccent,
                                      value: this.value8,
                                      onChanged: (bool value_7) {
                                        setState(() {
                                          this.value8=value_7;
                                        });
                                      },
                                      
                                    ),
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
                            Checkbox(
                                      activeColor: Colors.greenAccent,
                                      checkColor: Colors.redAccent,
                                      value: this.value5,
                                      onChanged: (bool value_4) {
                                        setState(() {
                                          this.value5=value_4;
                                        });
                                      },
                                      
                                    ),
                                    Checkbox(
                                      activeColor: Colors.redAccent,
                                      checkColor: Colors.greenAccent,
                                      value: this.value6,
                                      onChanged: (bool value_5) {
                                        setState(() {
                                          this.value6=value_5;
                                        });
                                      },
                                      
                                    ),
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
                            
                                                           Checkbox(
                                      activeColor: Colors.greenAccent,
                                      checkColor: Colors.redAccent,
                                      value: this.value3,
                                      onChanged: (bool value_2) {
                                        setState(() {
                                          this.value3=value_2;
                                        });
                                      },
                                      
                                    ),
                                    Checkbox(
                                      activeColor: Colors.redAccent,
                                      checkColor: Colors.greenAccent,
                                      value: this.value4,
                                      onChanged: (bool value_3) {
                                        setState(() {
                                          this.value4=value_3;
                                        });
                                      },
                                      
                                    ),
                            
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
                            
                                                           Checkbox(
                                      activeColor: Colors.greenAccent,
                                      checkColor: Colors.redAccent,
                                      value: this.value1,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.value1=value;
                                        });
                                      },
                                      
                                    ),
                                    Checkbox(
                                      activeColor: Colors.redAccent,
                                      checkColor: Colors.greenAccent,
                                      value: this.value2,
                                      onChanged: (bool value_1) {
                                        setState(() {
                                          this.value2=value_1;
                                        });
                                      },
                                      
                                    ),
                            
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
