import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ContactUsBottomAppBar(
      //   companyName: 'DSC-SOLUTION',
      //   textColor: Colors.white,
      //   backgroundColor: Colors.teal.shade300,
      //   email: 'adoshi26.ad@gmail.com',
      // ),
      backgroundColor: Colors.indigo[900],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "About Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                  // fontSize: _large ? 60 : (_medium ? 50 : 40),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: ContactUs(
                  // borderRadius: BorderRadius.circular(8),
                  cardColor: Colors.teal[100],
                  textColor: Colors.teal.shade900,
                  logo: AssetImage('assets/images/logo.jpeg'),
                  email: 'dscflutter@gmail.com',
                  companyName: 'Satish Chauhan',
                  companyColor: Colors.teal[300],
                  phoneNumber: '+917818XXXXX',
                  // website: 'https://abhishekdoshi.godaddysites.com',
                  // githubUserName: 'AbhishekDoshi26',
                  linkedinURL: 'https://www.linkedin.com/in/satish603/',
                  tagLine: 'Flutter Developer',
                  taglineColor: Colors.teal.shade100,
                  // twitterHandle: 'AbhishekDoshi26',
                  instagram: 'satish_603',
                  // facebookHandle: '_abhishek_doshi'
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
                child: ContactUs(
                  cardColor: Colors.teal[100],
                  textColor: Colors.teal.shade900,
                  logo: AssetImage('assets/images/logo.jpeg'),
                  email: 'dscflutter@gmail.com',
                  companyName: 'Tejashri Mitbavkar',
                  companyColor: Colors.teal[300],
                  phoneNumber: '+917818XXXXX',
                  // website: 'https://abhishekdoshi.godaddysites.com',
                  // githubUserName: 'AbhishekDoshi26',
                  linkedinURL:
                      'https://www.linkedin.com/in/tejashri-mitbavkar-bb3871192',
                  tagLine: 'Flutter Developer',
                  taglineColor: Colors.teal.shade100,
                  // twitterHandle: 'AbhishekDoshi26',
                  instagram: 'teju.s.m',
                  // facebookHandle: '_abhishek_doshi'
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
                child: ContactUs(
                  cardColor: Colors.teal[100],
                  textColor: Colors.teal.shade900,
                  logo: AssetImage('assets/images/logo.jpeg'),
                  email: 'dscflutter@gmail.com',
                  companyName: 'Arijit Bera',
                  companyColor: Colors.teal[300],
                  phoneNumber: '+917818XXXXX',
                  // website: 'https://abhishekdoshi.godaddysites.com',
                  // githubUserName: 'AbhishekDoshi26',
                  linkedinURL:
                      'https://www.linkedin.com/in/arijit-bera-792006157',
                  tagLine: 'Flutter Developer',
                  taglineColor: Colors.teal.shade100,
                  // twitterHandle: 'AbhishekDoshi26',
                  instagram: 'bera_213_',
                  // facebookHandle: '_abhishek_doshi'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
