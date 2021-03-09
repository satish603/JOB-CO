import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 


 
class Apply extends StatefulWidget {
  Apply({Key key}) : super(key: key);
 
  @override
  _ApplyState  createState() => _ApplyState();
}
 
class _ApplyState extends State<Apply> {
 
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: shopprofileView()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
 
  Widget shopprofileView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             
              Text('Amul Shop', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(height: 24,width: 24)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0,0 ,60),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(child: Image.asset('assets/images/download.jpg', height: 140, width: 140, fit: BoxFit.cover,)),
              ),
              Positioned(bottom: 1, right: 1 ,child: Container(
                height: 30, width: 30,
                child: Icon(Icons.add_a_photo, color: Colors.white,),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ))
            ],
          ),
        ),
        Expanded(child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(26), topRight: Radius.circular(26)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black54, Color.fromRGBO(0, 42, 103, 1)]
            )
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 25, 21, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text('Amul Shop', style: TextStyle(color: Colors.white70)),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18))),
                ),//,border: Border.all(width: 1.0, color: Colors.white70)
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 5, 21, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text('Email:amul@gmail.com', style: TextStyle(color: Colors.white70)),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(21, 5, 21, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text('Available slots:15 only', style: TextStyle(color: Colors.white70)),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 5, 21, 4),
                child: Container(
                  height: 70,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Location: Near Sbi, vijaya vittal nagar ', style: TextStyle(color: Colors.white70)),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 5, 21, 4),
                child: Container(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text('Phone number:9475558858', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container( height: 50, width: 200,
                    child: Align(child: Text('Apply now', style: TextStyle(color: Colors.white70, fontSize: 20),),),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30), topRight: Radius.circular(30)
                     ) ),
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