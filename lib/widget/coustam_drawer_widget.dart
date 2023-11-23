// import 'dart:html';

import 'package:chatjptflutter_projecr/screens/auth_ui/wellcome_Screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CoustamDrawer extends StatefulWidget {
  const CoustamDrawer({Key? key}) : super(key: key);

  @override
  State<CoustamDrawer> createState() => _CoustamDrawerState();
}

class _CoustamDrawerState extends State<CoustamDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListTile(
                title: Text("Warish"),
                subtitle: Text("version 2.0.1"),
                leading: CircleAvatar(
                  radius: 22.2,
                  backgroundColor: AppConstant.appMainColor,
                  child: Text("W"),
                ),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              color: Colors.grey,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(Icons.home, color: Colors.black),
                trailing: Icon(Icons.arrow_forward, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                title: Text(
                  "Products",
                  style: TextStyle(color: Color.fromRGBO(15, 15, 14, 1)),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: Color.fromRGBO(15, 15, 14, 1),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(15, 15, 14, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                title: Text(
                  "Order",
                  style: TextStyle(color: Color.fromRGBO(15, 15, 14, 1)),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: Color.fromRGBO(15, 15, 14, 1),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(15, 15, 14, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                title: Text(
                  "Contact",
                  style: TextStyle(color: Color.fromRGBO(15, 15, 14, 1)),
                ),
                leading: Icon(
                  Icons.help,
                  color: Color.fromRGBO(15, 15, 14, 1),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(15, 15, 14, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(() => WellCome_Screen1());
                },
                title: Text(
                  "Logout",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppConstant.appTextColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstant.appTextColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
