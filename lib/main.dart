// ignore_for_file: prefer_const_constructors

import 'package:chatjptflutter_projecr/screens/auth_ui/sign_in_screen.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/sign_up_screen.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/splash_screen.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/wellcome_Screen.dart';
import 'package:chatjptflutter_projecr/screens/user_panel/user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: WellCome_Screen1(),
        builder: EasyLoading.init());
  }
}
