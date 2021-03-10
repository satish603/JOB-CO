import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dsc/ui/widgets/textformfield.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  String name = '';
  String email = '';
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            profile() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

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
              Positioned(
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
                  ))
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
