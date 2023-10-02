// ignore_for_file: unused_local_variable

import 'package:chatjptflutter_projecr/models/user_model.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/sign_in_screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for password visibility
  // var isPasswordVisible = false.obs;
  Future<void> ForgotPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please wait..");
      //for user Signup
      //  ans = _auth.sendPasswordResetEmail(email: userEmail);

      _auth.sendPasswordResetEmail(email: userEmail).then((value) {
        Get.snackbar("Request Sent Successfully",
            "Password reset link sent to $userEmail",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.teal,
            colorText: AppConstant.appTextColor);
        EasyLoading.dismiss();
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
        Get.snackbar(error.toString(), "Solve this error before",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.teal,
            colorText: AppConstant.appTextColor);
        // EasyLoading.dismiss();
      });
      Get.offAll(() => SignScreen1());

      // Get.snackbar(
      //     "Request Sent Successfully", "Password reset link sent to $userEmail",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.teal,
      //     colorText: AppConstant.appTextColor);
      // EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appScondaryColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
