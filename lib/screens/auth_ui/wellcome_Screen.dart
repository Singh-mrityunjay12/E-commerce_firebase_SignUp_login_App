// import 'dart:html';

import 'package:chatjptflutter_projecr/controllers/google_sign_controller.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/sign_in_screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:lottie/lottie.dart';

class WellCome_Screen1 extends StatefulWidget {
  const WellCome_Screen1({Key? key}) : super(key: key);

  @override
  State<WellCome_Screen1> createState() => _WellCome_Screen1State();
}

class _WellCome_Screen1State extends State<WellCome_Screen1> {
  //initialse the GoogleSignInController
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Wellcome to my Ecommerce App"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: AppConstant.appMainColor,
              child: Lottie.asset("images/shopping1.json", width: 410),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: const Text(
                "Happy Shopping",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.4,
                height: Get.height / 13,
                decoration: BoxDecoration(
                    color: AppConstant.appScondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                    onPressed: () {
                      _googleSignInController.signInWithGoogle();
                    },
                    icon: Image.asset(
                      "images/g4.png",
                      height: 50,
                      width: 50,
                    ),
                    label: Text(
                      "Sign in with Google",
                      style: TextStyle(color: AppConstant.appTextColor),
                    )),
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            Material(
              child: Container(
                width: Get.width / 1.4,
                height: Get.height / 13,
                decoration: BoxDecoration(
                    color: AppConstant.appScondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                    onPressed: () {
                      Get.to(() => SignScreen1());
                    },
                    icon: Icon(
                      Icons.email,
                      size: 45,
                      color: AppConstant.appTextColor,
                    ),
                    label: Text(
                      "Sign in with email",
                      style: TextStyle(color: AppConstant.appTextColor),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
