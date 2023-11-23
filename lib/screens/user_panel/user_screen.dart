// import 'dart:io';

// import 'dart:html';

import 'package:chatjptflutter_projecr/controllers/banners_controller.dart';
import 'package:chatjptflutter_projecr/controllers/categary_controller.dart';
import 'package:chatjptflutter_projecr/models/banner_model.dart';
import 'package:chatjptflutter_projecr/models/cotegary_model.dart';
import 'package:chatjptflutter_projecr/screens/auth_ui/wellcome_Screen.dart';
import 'package:chatjptflutter_projecr/utils/appContrant.dart';
import 'package:chatjptflutter_projecr/widget/banner_Widget.dart';
import 'package:chatjptflutter_projecr/widget/categary_widget.dart';
import 'package:chatjptflutter_projecr/widget/coustam_drawer_widget.dart';
import 'package:chatjptflutter_projecr/widget/heading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';

import 'package:uuid/uuid.dart';

class UserScreen1 extends StatefulWidget {
  const UserScreen1({Key? key}) : super(key: key);

  @override
  State<UserScreen1> createState() => _UserScreen1State();
}

class _UserScreen1State extends State<UserScreen1> {
  static BannerController bannerController = Get.put(BannerController());
  static CategaryController categaryController = Get.put(CategaryController());

  List<dynamic> banner1 = [
    "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",
    "https://th.bing.com/th/id/OIG.lVXjWwlHyIo4QdjnC1YE",
    "https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=",
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://as1.ftcdn.net/v2/jpg/05/64/11/42/1000_F_564114238_mcU43Fplgq3J1wpxYUCvDIew9JxUbJrB.jpg"
  ];

  // BannerModel bannerModel = BannerModel();
  int count = 0;
  String img =
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Flove&psig=AOvVaw1vBw-TU_s_izJ3ntSVSAZz&ust=1697120119867000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMjopqGX7oEDFQAAAAAdAAAAABAD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.amber),
          backgroundColor: AppConstant.appMainColor,
          title: Text(AppConstant.appMainName),
          centerTitle: true,
          actions: [],
        ),
        drawer: CoustamDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 90.0,
                ),
                // Text('Ali'),
                //banners
                BannerWidget(),
                Heading_Widget(
                    headingTitle: "Categories",
                    headingSubTitle: "According to your budget",
                    onTap: () {},
                    buttonText: "See More >"),
                CategaryWidget(),
                Heading_Widget(
                    headingTitle: "Flash Sell",
                    headingSubTitle: "According to your budget",
                    onTap: () {},
                    buttonText: "See More >"),
                // SizedBox(
                //   height: 30,
                // ),

                // ElevatedButton(
                //     onPressed: () {
                //       String img = categaryController.listImages[count];
                //       String img1 = categaryController.listCategary[count];

                //       categaryController.CategaryItem(Uuid().v1(), img, img1,
                //           DateTime.now()
                //           );
                //       setState(() {
                //         count++;
                //       });
                //     },
                //     child: Text("categary")),
              ],
            ),
          ),
        )

        //  Container(
        //     child: Column(children: [
        //   Container(
        //       margin: EdgeInsets.only(top: 20),
        //       child: InkWell(
        //         onTap: () {
        //           bannerController.pickImage();
        //         },
        //         child: CircleAvatar(
        //           radius: 30,
        //           backgroundColor: Colors.deepOrange,
        //         ),
        //       )),
        //   SizedBox(
        //     height: 20,
        //   ),
        //   Center(
        //     child: InkWell(
        //       onTap: () async {
        //         // final my = bannerController.promig;
        //         // BannerController.instance
        //         //     .AccetImage(BannerController.instance.promig);

        //         bannerController.UplodImageUlr(banner1[count]);
        //         setState(() {
        //           count++;
        //         });
        //       },
        //       child: Text("addImage"),
        //     ),
        //   ),
        // ]))
        );
  }
}
