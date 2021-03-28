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
      backgroundColor: Colors.indigo[300],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, top:35, right: 20, bottom:0),
              ),
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
                  cardColor: Colors.grey[300],
                  textColor: Colors.black,
                  logo: AssetImage('assets/images/logo.jpeg'),
                  email: 'dscflutter@gmail.com',
                  companyName: 'Satish Chauhan',
                  companyColor: Colors.black54,
                  phoneNumber: '+917818XXXXX',
                  // website: 'https://abhishekdoshi.godaddysites.com',
                  // githubUserName: 'AbhishekDoshi26',
                  linkedinURL: 'https://www.linkedin.com/in/satish603/',
                  tagLine: 'Flutter Developer',
                  taglineColor: Colors.black38,
                  // twitterHandle: 'AbhishekDoshi26',
                  instagram: 'satish_603',
                  // facebookHandle: '_abhishek_doshi'
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
                child: ContactUs(
                  cardColor: Colors.grey[300],
                  textColor: Colors.black,
                  logo: AssetImage('assets/images/logo.jpeg'),
                  email: 'dscflutter@gmail.com',
                  companyName: 'Tejashri Mitbavkar',
                  companyColor: Colors.black54,
                  phoneNumber: '+917818XXXXX',
                  // website: 'https://abhishekdoshi.godaddysites.com',
                  // githubUserName: 'AbhishekDoshi26',
                  linkedinURL:
                      'https://www.linkedin.com/in/tejashri-mitbavkar-bb3871192',
                  tagLine: 'Flutter Developer',
                  taglineColor: Colors.black38,
                  // twitterHandle: 'AbhishekDoshi26',
                  instagram: 'teju.s.m',
                  // facebookHandle: '_abhishek_doshi'
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
                child: ContactUs(
                  cardColor: Colors.grey[300],
                  textColor: Colors.black,
                  logo: AssetImage('assets/images/logo.jpeg'),
                  email: 'dscflutter@gmail.com',
                  companyName: 'Arijit Bera',
                  companyColor: Colors.black54,
                  phoneNumber: '+917818XXXXX',
                  // website: 'https://abhishekdoshi.godaddysites.com',
                  // githubUserName: 'AbhishekDoshi26',
                  linkedinURL:
                      'https://www.linkedin.com/in/arijit-bera-792006157',
                  tagLine: 'Flutter Developer',
                  taglineColor: Colors.black38,
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
