import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/pages/main_page.dart';
import 'package:instagram/services/cloud_firestore_services.dart';
import 'package:instagram/services/firebase_auth_services.dart';

class SignUpButton extends StatefulWidget {
  final TextEditingController userNameController;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onTap;
  const SignUpButton(
      {super.key,
      required this.onTap,
      required this.emailController,
      required this.passwordController,
      required this.userNameController});

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  bool isLoadig = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: ElevatedButton(
          onPressed: () async {
            setState(() {
              isLoadig = true;
            });

            var isSucced = await FirebaseAuthServices()
                .signUpWithEmailAndPassword(widget.emailController.text,
                    widget.passwordController.text);
            var temp = await CloudFirestoreServices().createUser(
                widget.emailController.text, widget.userNameController.text);

            if ((isSucced && temp) == true) {
              Get.offAll(HomePage());
            } else if (isSucced == null) {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 60,
                    color: Colors.grey,
                    child: Text(
                      "Giriş başarısız",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                },
              );
            }

            setState(() {
              isLoadig = false;
            });
          },
          child: isLoadig
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : const Text("Sign Up")),
    );
  }
}
