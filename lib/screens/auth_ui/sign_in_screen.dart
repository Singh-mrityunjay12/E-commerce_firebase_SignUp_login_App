import 'dart:io';

import 'package:chatjptflutter_projecr/controllers/get_user_data_controller.dart';
import 'package:chatjptflutter_projecr/controllers/sign_in_screen_controller.dart';
import 'package:chatjptflutter_projecr/screens/admin_panel/admin_main_screen.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/forgot_password_screen.dart';
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

class SignScreen1 extends StatefulWidget {
  const SignScreen1({Key? key}) : super(key: key);

  @override
  State<SignScreen1> createState() => _SignScreen1State();
}

class _SignScreen1State extends State<SignScreen1> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //ye hame didect karake bata dega ki in running time my keyboard open or not
    return KeyboardVisibilityBuilder(builder: (context, iskeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScondaryColor,
          elevation: 0,
          title: const Text(
            " Sign In",
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Obx(
                      () => TextFormField(
                        controller: userPassword,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: signInController.isPasswordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  signInController.isPasswordVisible.toggle();
                                },
                                child: signInController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                    )),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("")),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                            onTap: () {
                              Get.to(() => ForgotPaswordScreen());
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: AppConstant.appScondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )))
                  ]),
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
                        String password = userPassword.text.trim();
                        if (email.isEmpty || password.isEmpty) {
                          Get.snackbar("Error", "Please enter all details",
                              backgroundColor: Colors.teal,
                              colorText: AppConstant.appTextColor,
                              snackPosition: SnackPosition.BOTTOM);
                        } else {
                          UserCredential? userCredential =
                              await signInController.signInMethod(
                                  email, password);
                          var userData = await getUserDataController
                              .getUserData(userCredential!.user!.uid);
                          if (userCredential != null) {
                            if (userCredential.user!.emailVerified) {
                              //manage multiple dashboard
                              if (userData[0]['isAdmin'] == true) {
                                Get.offAll(() => AdminMainScreen());
                                Get.snackbar(
                                    "Success Admin login", "login Successfully",
                                    backgroundColor: Colors.teal,
                                    colorText: AppConstant.appTextColor,
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                Get.offAll(() => UserScreen1());
                                Get.snackbar(
                                    "Success user login", "login Successfully",
                                    backgroundColor: Colors.teal,
                                    colorText: AppConstant.appTextColor,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                              Get.snackbar("Success", "login Successfully",
                                  backgroundColor: Colors.teal,
                                  colorText: AppConstant.appTextColor,
                                  snackPosition: SnackPosition.BOTTOM);
                              Get.offAll(() => UserScreen1());
                            } else {
                              Get.snackbar("Error",
                                  "please verified th email before login",
                                  backgroundColor: Colors.teal,
                                  colorText: AppConstant.appTextColor,
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          } else {
                            Get.snackbar("Error", "please try again",
                                backgroundColor: Colors.teal,
                                colorText: AppConstant.appTextColor,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: AppConstant.appTextColor, fontSize: 19),
                      )),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: AppConstant.appScondaryColor, fontSize: 19),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAll(() => SignUpScreen());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: Colors.teal),
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
