import 'package:dsc/constants/constants.dart';
import 'package:dsc/ui/complete_page.dart';
import 'package:dsc/ui/contactus.dart';
import 'package:dsc/ui/jobdetails.dart';
import 'package:dsc/ui/jobhome.dart';
import 'package:dsc/ui/shops.dart';
import 'package:dsc/ui/signin.dart';
import 'package:dsc/ui/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;

// FirebaseAuth instance
  AuthenticationProvider(this.firebaseAuth);
//Constructor to initialize the Firebase Auth instance.
  Stream<User> get authStateChanges => firebaseAuth.idTokenChanges();
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var user = FirebaseAuth.instance.currentUser;

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
              Container(
                height: 64,
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 32,
                      backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWOnlTR6M8ru8eup4smkyRvcS63JIGl6tIgm6mzQcHDlD4loJ61p2fHphe1GLqpaPkJ14&usqp=CAU'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${user.displayName}',
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
                    child:
                        const Text('Signout', style: TextStyle(fontSize: 20)),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    elevation: 5,
                  )),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Card(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Shop1()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/application.png',
                              height: 128,
                            ),
                            Text(
                              'Shops',
                              style: cardTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: FlatButton(
                        onPressed: () async {
                          var firebaseUser = FirebaseAuth.instance.currentUser;
                          // ignore: unused_local_variable
                          DocumentSnapshot value = await FirebaseFirestore
                              .instance
                              .collection("users")
                              .doc(firebaseUser.uid)
                              .get()
                              .then((value) {
                            // return value.data();
                            print(value.data());
                            //  Text:value.data();
                          });

                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Profile()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/download.jpg',
                              height: 128,
                            ),
                            Text(
                              'Profile',
                              style: cardTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Contact()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/download.jpg',
                              height: 128,
                            ),
                            Text(
                              'Contact',
                              style: cardTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/download.jpg',
                              height: 128,
                            ),
                            Text(
                              'Job',
                              style: cardTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),

                    Card(
                      child: FlatButton(
                        onPressed: () {                     
                         padding: EdgeInsets.all(100.0);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => JobDetials()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/download.jpg',
                              height: 128,
                            ),
                            Text(
                              'Job Details',
                              style: cardTextStyle,
                            )
                          ],
                        ),
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
