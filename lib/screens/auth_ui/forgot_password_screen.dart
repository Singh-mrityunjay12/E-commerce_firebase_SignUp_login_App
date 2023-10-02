import 'dart:io';

import 'package:chatjptflutter_projecr/controllers/forgot_passaword_controller.dart';
import 'package:chatjptflutter_projecr/controllers/sign_in_screen_controller.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/sign_up_screen.dart';
import 'package:chatjptflutter_projecr/screens/user_panel/user_screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';

class ForgotPaswordScreen extends StatefulWidget {
  const ForgotPaswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPaswordScreen> createState() => _ForgotPaswordScreenState();
}

class _ForgotPaswordScreenState extends State<ForgotPaswordScreen> {
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //ye hame didect karake bata dega ki in running time my keyboard open or not
    return KeyboardVisibilityBuilder(builder: (context, iskeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScondaryColor,
          elevation: 0,
          title: const Text(
            "Forgot Password",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              iskeyboardVisible
                  ? Text("Wellcome to my Ecommerce App")
                  : Column(
                      children: [
                        Container(
                            width: Get.height / 1.6,
                            color: AppConstant.appScondaryColor,
                            child: Lottie.asset("images/shopping1.json",
                                height: 350))
                      ],
                    ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: userEmail,
                    cursorColor: AppConstant.appScondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 17,
                  decoration: BoxDecoration(
                      color: AppConstant.appScondaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                      onPressed: () async {
                        String email = userEmail.text.trim();

                        if (email.isEmpty) {
                          Get.snackbar("Error", "Please enter all details",
                              backgroundColor: Colors.teal,
                              colorText: AppConstant.appTextColor,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          String email = userEmail.text.trim();
                          forgotPasswordController.ForgotPasswordMethod(email);
                        }
                      },
                      child: Text(
                        "Forget",
                        style: TextStyle(
                            color: AppConstant.appTextColor, fontSize: 19),
                      )),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
            ],
          ),
        ),
      );
    });
  }
}
