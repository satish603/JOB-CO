import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Job extends StatefulWidget {
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  final double _borderRadius = 24;
  var items=[
    PlaceInfo("Amul Parlor",Color(0xff6DC8F3),Color(0xff73A1F9),
     "Available 15",
    "600/week",
    "near sbi,vvn"
    ),
    PlaceInfo("Biryani",Color(0xff6DC8F3),Color(0xff73A1F9),
     "Available 25",
    "550/week",
    "near icici atm,vdn"),
    PlaceInfo("Green chilly",Color(0xff6DC8F3),Color(0xff73A1F9),
    "Available 15",
    "500/week",
    "near icici atm,vdn"),
    PlaceInfo("Sandwich",Color(0xff6DC8F3),Color(0xff73A1F9),
     "Available 15",
    "450/week",
    "near icici atm,vdn"),
    PlaceInfo("Sandwich",Color(0xff6DC8F3),Color(0xff73A1F9),
     "Available 5",
    "500/week",
    "near icici atm,vdn"),
    PlaceInfo("Pizza",Color(0xff6DC8F3),Color(0xff73A1F9),
     "Available 5",
    "400/week",
    "near icici atm,vdn"),
    PlaceInfo("Pasta",Color(0xff6DC8F3),Color(0xff73A1F9),
     "Available 5",
    "350/week",
    "near icici atm,vdn"),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Job"),
    ),
    
    body: ListView.builder(itemCount:items.length,
    itemBuilder:(context,index){
      return
    Center(

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                gradient: LinearGradient(begin: Alignment.topLeft,
                colors: [items[index].startColor,items[index].endColor],
                end:Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: items[index].endColor,
                    blurRadius: 13,
                    offset: Offset(0,6),
                  )
                ]
               ),
              
                      ),
        Positioned(
          right:0,
          bottom: 0,
          top:0,
        child:CustomPaint(
          size: Size(100,150),
          painter: CustomCardShapePainter(_borderRadius,Colors.pink,Colors.red),

                ),),
                Positioned.fill(
                child:Row(
                    children: <Widget>[
                      Expanded(child:
                      Image.asset("assets/images/download.jpg", height: 64, width:64 ),
                      flex: 2,
                      ),
                      Expanded(
                        flex:4,
                        child: 
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text(items[index].name,
                          style: TextStyle(color:Colors.white, fontFamily:"Montserrat Medium",fontWeight: FontWeight.w700),
                          ),
                          Text(items[index].category,
                          style: TextStyle(color:Colors.white, fontFamily:"Montserrat Medium"),
                          ),
                          SizedBox(height:16),
                          Row(children:<Widget> [
                            SizedBox(width: 8),
                          Text(items[index].location,
                          style: TextStyle(color:Colors.white, fontFamily:"Montserrat Medium"),
                          ),

                          ])
                        ],
                      ),
                      ),
                      Expanded(
                        flex:2,
                        child: 
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(items[index].cla,
                          style: TextStyle(color:Colors.white, fontFamily:"Montserrat Medium",fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                      )
                    ],
                )
                )
              ],
          
              ),
                ),)
    ;}
    ));
            
          }
          }
          class PlaceInfo{
            final String name;
            final String category;
            final String location;
            final String cla;
            final Color startColor;
            final Color endColor;
            
            PlaceInfo(this.name, this.startColor,this.endColor,this.cla,this.location,this.category);
            

          }
          
          class CustomCardShapePainter extends CustomPainter{
            final double radius;
            final Color startColor;
            final Color endColor;
            CustomCardShapePainter(this.radius, this.startColor, this.endColor);
            @override 
            void paint(Canvas canvas, Size size){
              var radius=24.0;
              var paint=Paint();
              paint.shader=ui.Gradient.linear(
                Offset(0,0), Offset(size.width,size.height),[
                  HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
                  endColor
                ]
              );
              var path = Path()
              ..moveTo(0, size.height)
              ..lineTo(size.width-radius, size.height)
              ..quadraticBezierTo(size.width, size.height,size.width, size.height-radius)
              ..lineTo(size.width, radius)
              ..quadraticBezierTo(size.width, 0,size.width-radius, 0)
              ..lineTo(size.width-1.5*radius, 0)
              ..quadraticBezierTo(-radius, 2*radius,0, size.height)
              ..close();
              canvas.drawPath(path, paint);
                        }
            @override 
            bool shouldRepaint(CustomPainter oldDelegate)
{
  return true;
}}

