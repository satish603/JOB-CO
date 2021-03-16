import 'package:dsc/ui/jobdata.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  static const routeName = 'adduser';
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String id;
  TextEditingController jobNameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  String jobName;
  String salary;
  String imageUrl;
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD GADGETS"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Job Name",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              jobName = value;
            },
            controller: jobNameController,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Product Price",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              salary = value;
            },
            controller: salaryController,
          ),
          TextField(
            keyboardType: TextInputType.url,
            decoration: InputDecoration(
                focusedBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color: Colors.green,
                        width: 2,
                        style: BorderStyle.solid)),
                labelText: "Image URL",
                icon: Icon(
                  Icons.assignment,
                  color: Colors.orangeAccent,
                ),
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
            onChanged: (value) {
              imageUrl = value;
            },
            controller: imageUrlController,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 40),
                child: FlatButton(
                  color: Colors.black,
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    uploadingData(jobName, salary, imageUrl, isFavourite);
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
