import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc/ui/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dsc/ui/widgets/custom_shape.dart';
import 'package:dsc/ui/widgets/customappbar.dart';
import 'package:dsc/ui/widgets/responsive_ui.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dsc/ui/widgets/textformfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final firestore = FirebaseFirestore.instance;

enum UploadType {
  /// Uploads a randomly generated string (as a file) to Storage.
  string,

  /// Uploads a file from the device.
  file,

  /// Clears any tasks from the list.
  clear,
}

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final messagetextcontroller = TextEditingController();
  List<firebase_storage.UploadTask> _uploadTasks = [];
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool signingup = false;
  GlobalKey<FormState> _key = GlobalKey();
  // var name, email, photoUrl, uid, emailVerified, phnum;
  String _email, name, phnum;
  Widget dataname, datacontact, dataemail;
  final auth = FirebaseAuth.instance;

  Future<firebase_storage.UploadTask> uploadFile(PickedFile file) async {
    if (file == null) {
      EdgeAlert.show(context,
          title: 'No file was selected',
          description: "Please select image to upload",
          gravity: EdgeAlert.BOTTOM,
          icon: Icons.error,
          backgroundColor: Colors.blue[400]);

      return null;
    }

    firebase_storage.UploadTask uploadTask;
    final User user = auth.currentUser;
    final uid = user.uid;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('/$uid.jpg');

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

  Future<void> _downloadLink(firebase_storage.Reference ref) async {
    final link = await ref.getDownloadURL();

    await Clipboard.setData(ClipboardData(
      text: link,
    ));

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
      'Success!\n Copied download URL to Clipboard!',
    )));
  }

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
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat Medium"),
          );
        });
  }

  Widget firedata1() {
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
            userDocument["email"],
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat Medium"),
          );
        });
  }

  Widget firedata2() {
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
            userDocument["contact"],
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat Medium"),
          );
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
                // form(),
                SizedBox(
                  height: _height / 35,
                ),
                form(),

                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    final auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;
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
            child: Image(
              image: FirebaseImage(
                'gs://job-co.appspot.com/user_image/$uid.jpg',
                shouldCache: true, // The image should be cached (default: True)
                maxSizeBytes: 3000 * 1000, // 3MB max file size (default: 2.5MB)
                //cacheRefreshStrategy: CacheRefreshStrategy.NEVER,
              ),
              // Works with standard parameters, e.g.
              fit: BoxFit.cover,
              width: 100,
              height: 100,
              // ... etc.
            ),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            firedata(),
            SizedBox(height: _height / 40.0),
            firedata1(),
            SizedBox(height: _height / 40.0),
            firedata2(),
            SizedBox(height: _height / 40.0),
          ],
        ),
      ),
    );
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

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        final User user = auth.currentUser;
        final uid = user.uid;
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child('$uid.jpg');
        String url = (await ref.getDownloadURL()).toString();
        print("helloworld");
        print(url);

        firestore.collection("users").doc('$uid').update({
          "uid": uid,
          "photo": url,
        });

        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Dashboard()));
        // }
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
          'UPDATE PROFILE',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }
}