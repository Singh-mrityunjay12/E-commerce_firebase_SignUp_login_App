import 'package:chatjptflutter_projecr/screens/auth_ui/wellcome_Screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:google_sign_in/google_sign_in.dart';

class UserScreen1 extends StatefulWidget {
  const UserScreen1({Key? key}) : super(key: key);

  @override
  State<UserScreen1> createState() => _UserScreen1State();
}

class _UserScreen1State extends State<UserScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        actions: [
          GestureDetector(
              child: const Padding(
                  padding: EdgeInsets.all(8), child: Icon(Icons.logout)),
              onTap: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseAuth _auth = FirebaseAuth
                    .instance; //vairiable _auth ko isiliye bane h ki jisase hamlog firebase se bahar nikal sake
                await _auth.signOut();
                await googleSignIn.signOut();
                Get.offAll(() => const WellCome_Screen1());
              }),
        ],
      ),
    );
  }
}
