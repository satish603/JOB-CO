import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc/utils/operations.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String jobName;
  final String salary;
  final String imageUrl;
  final bool isApproved;
  final String id;
  final DocumentSnapshot documentSnapshot;
  ProductItem({
    @required this.imageUrl,
    @required this.documentSnapshot,
    @required this.id,
    @required this.isApproved,
    @required this.jobName,
    @required this.salary,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.jobName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Rs. ${widget.salary}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          editProduct(widget.isApproved, widget.id);
                        },
                        icon: widget.isApproved
                            ? Icon(
                                Icons.check_circle_rounded, //after click
                                color: Colors.greenAccent,
                              )
                            : Icon(
                                Icons.pending_actions_rounded,
                                color: Colors.greenAccent,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          deleteProduct(widget.documentSnapshot);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color.alphaBlend(Colors.orangeAccent,
                Colors.yellow) //Colors.blueGrey, //change card color
            ),
      ),
    );
  }
}
