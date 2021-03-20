import 'dart:io';
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

class Status extends StatefulWidget {
 Status({Key key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
 
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool signingup = false;
  // var name, email, photoUrl, uid, emailVerified, phnum;
  String _email, name, phnum;

    

  

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[300], Colors.yellowAccent],
            ),
          ),
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
             
                form(),
                SizedBox(
                  height: _height / 25,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
           
                
                 
                    
      child:Card(
                      elevation: 20,shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      child: Form(
        child: Column(
          children: <Widget>[
            Text('Application Status',
                style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff73A1F9)) ),
            SizedBox(height: _height / 80.0),
            Text('ShopName',textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: _height / 60.0),
            Text('Approval Status',textAlign: TextAlign.left,
                style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: _height / 60.0),
            Text('Approved/Rejected',textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: _height / 60.0),
          ],
        ),
      ),
    ));
  }
}
