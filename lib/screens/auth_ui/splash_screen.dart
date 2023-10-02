// import 'dart:js';

import 'dart:async';

import 'package:chatjptflutter_projecr/controllers/get_user_data_controller.dart';
import 'package:chatjptflutter_projecr/screens/admin_panel/admin_main_screen.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/wellcome_Screen.dart';
import 'package:chatjptflutter_projecr/screens/user_panel/user_screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class Splash_Screen1 extends StatefulWidget {
  const Splash_Screen1({Key? key}) : super(key: key);

  @override
  State<Splash_Screen1> createState() => _Splash_Screen1State();
}

class _Splash_Screen1State extends State<Splash_Screen1> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      //context isako uper se mil jayega
      loggin(context);
    });
  }

  Future<void> loggin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);
      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => AdminMainScreen());
      } else {
        Get.offAll(() => UserScreen1());
      }
    } else {
      Get.to(() => WellCome_Screen1());
    }
  }

  @override
  Widget build(BuildContext context) {
    // inintState() {
    //   print("Mrityunjya");
    //   super.initState();
    //   // Get.to(() => UserScreen1());
    //   Timer(Duration(seconds: 3), () {
    //     Get.to(() => UserScreen1());
    //   });
    // }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScondaryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: size.width,
              // height: 300,
              alignment: Alignment.center,
              child: Lottie.asset(
                "images/shopping.json",
              ),
            )),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: Get.width, //maintain the width of container by using Get
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPowerdBy,
                style: const TextStyle(
                    color: AppConstant.appTextColor, fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
