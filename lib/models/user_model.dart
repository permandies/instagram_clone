import 'dart:typed_data';

class UserModel {
  final String userName;
  final String email;
  Uint8List? pp;
  final String id;
  UserModel(
      {required this.userName, required this.email, this.pp, required this.id});

  @override
  String toString() {
    return userName;
  }
}
