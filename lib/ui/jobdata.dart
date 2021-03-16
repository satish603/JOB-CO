import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadingData(String _jobName, String _salary, String _imageUrl,
    bool _isFavourite) async {
  await FirebaseFirestore.instance.collection("Job Details").add({
    'jobName': _jobName,
    'salary': _salary,
    'imageUrl': _imageUrl,
    'isFavourite': _isFavourite,
  });
}

Future<void> editProduct(bool _isFavourite, String id) async {
  await FirebaseFirestore.instance
      .collection("Job Details")
      .doc(id)
      .update({"isFavourite": !_isFavourite});
}

Future<void> deleteProduct(DocumentSnapshot doc) async {
  await FirebaseFirestore.instance
      .collection("Job Details")
      .doc(doc.id)
      .delete();
}
