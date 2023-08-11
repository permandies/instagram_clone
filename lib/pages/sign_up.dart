import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/widgets/login_widgets/sign_up_button.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Image.asset("assets/insta_logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Bir email giriniz";
                    } else if (value.isEmpty) {
                      return "Bir email giriniz";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Geçerli bir email giriniz";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.black87,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) {
                      return "Bir kullanıcı adı giriniz";
                    } else if (value.isEmpty) {
                      return "Bir kullanıcı adı giriniz";
                    } else if (!GetUtils.isUsername(value)) {
                      return "Geçerli bir kullanıcı adı giriniz";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.black87,
                  decoration: const InputDecoration(
                    hintText: "User Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  controller: userNameController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) {
                      return "Bir isim giriniz";
                    } else if (value.isEmpty) {
                      return "Bir isim giriniz";
                    } else if (value.length < 3) {
                      return "İsminiz en az 3 haneli olmalı";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.black87,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  controller: nameController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null) {
                      return "Bir şifre giriniz";
                    } else if (value.isEmpty) {
                      return "Bir şifre giriniz";
                    } else if (value.length < 6) {
                      return "Şifreniz en az 6 haneli olmalı";
                    } else {
                      return null;
                    }
                  },
                  cursorColor: Colors.black87,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SignUpButton(
                userNameController: userNameController,
                passwordController: passwordController,
                emailController: emailController,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
