import 'package:dsc/ui/contactus.dart';
import 'package:dsc/ui/jobdetails.dart';
import 'package:dsc/ui/jobhome.dart';
import 'package:dsc/ui/shops.dart';
import 'package:dsc/ui/signin.dart';
import 'package:dsc/ui/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
 Widget dataname;
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
    final auth = FirebaseAuth.instance;
   
    final User user = auth.currentUser;
    final uid = user.uid;
     Widget firedata() {
    //BuildContext context
    var firebaseUser = FirebaseAuth.instance.currentUser;
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          return new Text(
            userDocument["name"],
            style: TextStyle(
                fontSize: 20,
                 color: Colors.white,
                              fontFamily: "Montserrat Regular",
                fontWeight: FontWeight.bold,
                ),
          );
        });
  }
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 64,
                margin:
                    EdgeInsets.only(left: 20, top: 35, right: 20, bottom: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 32,
                      child: Image(
                        image: FirebaseImage(
                          'gs://job-co.appspot.com/user_image/$uid.jpg',
                          shouldCache:
                              true, // The image should be cached (default: True)
                          maxSizeBytes:
                              3000 * 1000, // 3MB max file size (default: 2.5MB)
                          cacheRefreshStrategy: CacheRefreshStrategy.NEVER,
                        ),
                        // Works with standard parameters, e.g.
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        // ... etc.
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        firedata(),
                        // Text(
                        //   firedata(),
                        //   style: TextStyle(
                        //       fontFamily: "Montserrat Medium",
                        //       color: Colors.white,
                        //       fontSize: 20),
                        // ),
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
                      elevation: 15,
                      margin: EdgeInsets.all(20),
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
                              'assets/images/jobb.jpg',
                              height: 60,
                            ),
                            Text('JOBS',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        onPressed: () {
                          padding:
                          EdgeInsets.all(100.0);
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
                              height: 60,
                            ),
                            Text('JOBS DETAILS',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      margin: EdgeInsets.all(20),
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
                          }); //ye kyu kiya hai teju?

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
                              'assets/images/profo.jpg',
                              height: 60,
                            ),
                            Text('PROFILE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      margin: EdgeInsets.all(20),
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
                              'assets/images/application.jpg',
                              height: 60,
                            ),
                            Text('SHOPS',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 15,
                      margin: EdgeInsets.all(20),
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
                              'assets/images/contact.png',
                              height: 50,
                            ),
                            Text('CONTACT US',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                )),
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