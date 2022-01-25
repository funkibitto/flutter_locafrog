import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.profileImageUrl});

  late String id;
  late String name;
  late String email;
  String? profileImageUrl;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final _snapshotData = snapshot.data() as Map;
    name = _snapshotData["name"];
    email = _snapshotData["email"];
    profileImageUrl = _snapshotData["_snapshotData"];
    id = _snapshotData["id"];
  }
}
