import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      //right now whatever device run on your application then  let me give token of that user device after the fetching
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        update();
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.brown,
          colorText: AppConstant.appTextColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
