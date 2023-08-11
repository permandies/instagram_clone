import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:instagram/controller/controller.dart';

class FirebaseStorageServies {
  var firebaseStorage = FirebaseStorage.instance;
  Controller controller = Get.find<Controller>();
  uploadImage(Uint8List data) async {
    try {
      await firebaseStorage.ref(controller.currentUser!.id).putData(data);
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  deleteImage() async {
    await firebaseStorage.ref(controller.currentUser!.id).delete();
  }
}
