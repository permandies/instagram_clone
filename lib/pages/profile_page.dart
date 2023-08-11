import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/controller/controller.dart';
import 'package:instagram/services/firebase_storage.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfilePhotoWidget(),
      ],
    );
  }
}

class ProfilePhotoWidget extends StatefulWidget {
  ProfilePhotoWidget({super.key});

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  var isLoading = false;

  final Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        resimCek();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4),
        child: Align(
          child: Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(300),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: isLoading
                    ? SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ))
                    : controller.currentUser!.pp == null
                        ? Image.asset(
                            "assets/anonim.jpg",
                            fit: BoxFit.cover,
                          )
                        : Image.memory(controller.currentUser!.pp!)),
          ),
        ),
      ),
    );
  }

  resimCek() async {
    setState(() {
      isLoading = true;
    });

    var imageUlist;
    final ImagePicker picker = ImagePicker();
    final XFile? temp = await picker.pickImage(source: ImageSource.camera);
    if (temp != null) {
      imageUlist = await temp.readAsBytes();
      bool isSucced = await FirebaseStorageServies().uploadImage(imageUlist);
      if (isSucced) {
        controller.currentUser!.pp = imageUlist;
      }
    }
    setState(() {
      isLoading = false;
    });
  }
}
