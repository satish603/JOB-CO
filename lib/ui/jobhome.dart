import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc/ui/jobItem.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job List"),
        backgroundColor: Colors.redAccent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("jobs").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    return ProductItem(
                      documentSnapshot: data,
                      id: data.id,
                      isApproved: data['isApproved'],
                      imageUrl: data['imageUrl'],
                      jobName: data['jobName'],
                      salary: data['salary'],
                    );
                  },
                );
        },
      ),
    );
  }
}
