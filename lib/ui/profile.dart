import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dsc/ui/widgets/textformfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

enum UploadType {
  file,
}

class _ProfileState extends State<Profile> {
  List<firebase_storage.UploadTask> _uploadTasks = [];
  String number = "", name = "", email = "";
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<firebase_storage.UploadTask> uploadFile(PickedFile file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No file was selected'),
      ));
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    final User user = auth.currentUser; //new
    final uid = user.uid; //new
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('User image')
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
    return Scaffold(
        body:
            profile() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
  /* Future chooseFile() async{
                        await ImagePicker.pickImage(source: ImageSource.gallery).then((image){
                          setState((){_image=image;});
                        });
                      }
Future uploadFile() async{
  StorageReference storageReference= FirebaseStorage.instance.ref()
  .child('Path(_image.path)');
StorageUploadTask uploadTask= storageRefence.putFile(_image);
awaituploadTask.onComplete;
print('File Uploaded');
StorageReference.getDownloadURL().then((fileURL){

                          setState((){_uploadedFileURL=fileURL;});
                        });
                      }*/

  Widget profile() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Profile ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(height: 24, width: 24)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/download.jpg',
                  height: 140,
                  width: 140,
                  fit: BoxFit.cover,
                )),
              ),
              GestureDetector(onTap: () async {
                PickedFile file =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                firebase_storage.UploadTask task = await uploadFile(file);
                if (task != null) {
                  setState(() {
                    _uploadTasks = [..._uploadTasks, task];
                  });
                }
                print('Adding photo');
              })

              /* Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                 

                    height: 35,
                    width: 35,
                    child: Icon(
                      Icons.add_a_photo,
                      
                      color: Colors.white,
                    ),
                   
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))*/
            ],
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.lightBlueAccent,
                    Color.fromRGBO(0, 41, 102, 1)
                  ])),
          child: Column(
            children: <Widget>[
              Theme(
                data: new ThemeData(hintColor: Colors.white),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email,
                        hint: "Email ID",
                        userTyped: (val) {
                          //  _email = val;
                        }
                        //controller: email,
                        ),
                  ),
                ),
              ),
              Text(email),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextField(
                      keyboardType: TextInputType.text,
                      icon: Icons.person,
                      hint: "Full Name",
                      userTyped: (val) {
                        name = val;
                      },
                      // controller: name,
                    ),
                  ),
                ),
              ),
              Text(number),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      icon: Icons.phone,
                      hint: "Phone Number",
                      userTyped: (val) {
                        // phnum = val;
                      },
                      // controller: phnum,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Align(
                        child: Text('Save now',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 20))),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
