// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:chatjptflutter_projecr/controllers/sing_up_screen_controller.dart';
import 'package:chatjptflutter_projecr/controllers/sing_up_screen_controller.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/sign_in_screen.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignScreen1State();
}

class _SignScreen1State extends State<SignUpScreen> {
//Initialise the signUpController
  final SignUpController signUpController = Get.put(SignUpController());
  //for data store karane ke liye hame TextEditingControler ko bhi banana hoga
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
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
              " Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "Wellcome to my Ecommerce App",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      child: TextFormField(
                        controller: userEmail,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      child: TextFormField(
                        controller: userName,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "UserName",
                            prefixIcon: Icon(Icons.person),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      child: TextFormField(
                        controller: userPhone,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            prefixIcon: Icon(Icons.phone),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      child: TextFormField(
                        controller: userCity,
                        cursorColor: AppConstant.appScondaryColor,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            hintText: "City",
                            prefixIcon: Icon(Icons.location_on),
                            contentPadding:
                                EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      child: Obx(
                        () => TextFormField(
                          controller: userPassword,
                          obscureText: signUpController.isPasswordVisible.value,
                          cursorColor: AppConstant.appScondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  signUpController.isPasswordVisible.toggle();
                                },
                                child: signUpController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                              contentPadding:
                                  EdgeInsets.only(top: 2.0, left: 8.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7))),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
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
                            String name = userName.text.trim();
                            String phone = userPhone.text.trim();
                            String city = userCity.text.trim();
                            String password = userPassword.text.trim();
                            String userDeviceToken = "";
                            if (email.isEmpty ||
                                name.isEmpty ||
                                phone.isEmpty ||
                                city.isEmpty ||
                                password.isEmpty) {
                              Get.snackbar("Error", "Please enter all details",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appScondaryColor,
                                  colorText: AppConstant.appTextColor);
                            } else {
                              UserCredential? userCredential =
                                  await signUpController.signUpMethod(
                                      name,
                                      email,
                                      phone,
                                      city,
                                      password,
                                      userDeviceToken);
                              if (userCredential != null) {
                                Get.snackbar("Verification sent email.",
                                    "Please check your email.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        AppConstant.appScondaryColor,
                                    colorText: AppConstant.appTextColor);
                                FirebaseAuth.instance.signOut();
                                Get.offAll(() => SignScreen1());
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
                        "Already have an account? ",
                        style: TextStyle(
                            color: AppConstant.appScondaryColor, fontSize: 19),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.offAll(() => SignScreen1());
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                                color: Colors.teal),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}
