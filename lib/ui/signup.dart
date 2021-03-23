//import 'dart:html';
// import 'dart:html';
import 'dart:io' as io;
import 'package:dsc/ui/customerdash.dart';
import 'package:dsc/ui/dashboard.dart';
import 'package:flutter/foundation.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);
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

enum UploadType {
  /// Uploads a randomly generated string (as a file) to Storage.
  string,

  /// Uploads a file from the device.
  file,

  /// Clears any tasks from the list.
  clear,
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<firebase_storage.UploadTask> _uploadTasks = [];
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool signingup = false;
  // var name, email, photoUrl, uid, emailVerified, phnum;
  String _email, _password, name, phnum;
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  // TextEditingController name1 = new TextEditingController();
  // //TextEditingController email = new TextEditingController();
  // TextEditingController phnum1 = new TextEditingController();
  Future<firebase_storage.UploadTask> uploadFile(PickedFile file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No file was selected'),
      ));
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('User image')
        .child('/user.jpg');

        var url = await ref.getDownloadURL();
    print(url);
    // document.querySelector('img').src = test;
  

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }

    return Future.value(uploadTask);
  }
 

  /// Handles the user pressing the PopupMenuItem item.
  /* Future<void> handleUploadType(UploadType type) async {
        PickedFile file =
            await ImagePicker().getImage(source: ImageSource.gallery);
        firebase_storage.UploadTask task = await uploadFile(file);
        if (task != null) {
          setState(() {
            _uploadTasks = [..._uploadTasks, task];
          });
        }
  }*/ //////not in use right now

  void _removeTaskAtIndex(int index) {
    setState(() {
      _uploadTasks = _uploadTasks..removeAt(index);
    });
  }

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
                button1(),
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
              onTap: () async {
                PickedFile file =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                firebase_storage.UploadTask task = await uploadFile(file);
                if (task != null) {
                  setState(() {
                    _uploadTasks = [..._uploadTasks, task];
                  });
                }
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 31),
                color: Colors.blue[900],
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
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,
            hint: "Email ID",
            userTyped: (val) {
              _email = val;
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
      icon: Icons.phone,
      hint: "Mobile Number(OPTIONAL)",
      userTyped: (val) {
        phnum = val;
      },
      // controller: phnum,
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
              activeColor: Colors.blue[400],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: _large ? 12 : (_medium ? 13 : 10)),
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
                fontWeight: FontWeight.w500,
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
                  backgroundColor: Colors.blue[400]);
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
                  backgroundColor: Colors.blue[400]);
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
                  backgroundColor: Colors.blue[400]);
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
                  color: Colors.blue[900],
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
              final User user = auth.currentUser;
              final uid = user.uid;
              /* firestore.collection("users").add({
                "name": name,
                "email": _email,
                "contact": phnum,
                "uid": uid
              }).then((value) {
                print(value.id);
                print(uid);
              });*/
              firestore.collection("users").doc('$uid').set({
                "name": name,
                "email": _email,
                "contact": phnum,
                "uid": uid
              });
              // .doc("collection")
              // .set(data);
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

              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => CDashboard()));
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
                backgroundColor: Colors.blue[400]);
          }
        } else {
          EdgeAlert.show(context,
              title: 'Signup Failed',
              description:
                  'All fields are required. Accept all terms and conditions',
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
          'SIGN UP',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
    
  }
   Widget button1() {
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
              final User user = auth.currentUser;
              final uid = user.uid;
              /* firestore.collection("users").add({
                "name": name,
                "email": _email,
                "contact": phnum,
                "uid": uid
              }).then((value) {
                print(value.id);
                print(uid);
              });*/
              firestore.collection("users").doc('$uid').set({
                "name": name,
                "email": _email,
                "contact": phnum,
                "uid": uid
              });
              // .doc("collection")
              // .set(data);
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

              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => CDashboard()));
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
                backgroundColor: Colors.blue[400]);
          }
        } else {
          EdgeAlert.show(context,
              title: 'Signup Failed',
              description:
                  'All fields are required. Accept all terms and conditions',
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
          'SIGN UP Bussiness',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
    
  }
} //end of signup
