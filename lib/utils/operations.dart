import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(
    String _jobName, String _salary, String _imageUrl, bool isApproved) async {
  await FirebaseFirestore.instance.collection("jobs").add({
    'jobName': _jobName,
    'salary': _salary,
    'imageUrl': _imageUrl,
    'isApproved': isApproved,
  });
}

Future<void> editProduct(bool isApproved, String id) async {
  await FirebaseFirestore.instance
      .collection("jobs")
      .doc(id)
      .update({"isApproved": !isApproved});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  await FirebaseFirestore.instance.collection("jobs").doc(doc.id).delete();
}
