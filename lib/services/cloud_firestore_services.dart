import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/controller.dart';
import 'package:instagram/models/user_model.dart';

class CloudFirestoreServices {
  var firebase = FirebaseFirestore.instance;
  Controller controller = Get.find<Controller>();
  createUser(String email, String userName) async {
    UserModel? userModel;

    try {
      await firebase.collection("User").add({}).then((value) {
        firebase.collection("User").doc(value.id).set({
          "email": email,
          "userName": userName,
          "id": value.id,
        });
        userModel = UserModel(userName: userName, email: email, id: value.id);
        controller.currentUser = userModel;
      });
      return true;
    } on FirebaseException catch (e) {
      print(e.message);
      return false;
    }
  }
}
