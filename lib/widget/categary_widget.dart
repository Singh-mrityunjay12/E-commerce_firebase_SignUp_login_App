import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatjptflutter_projecr/models/cotegary_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:image_card/image_card.dart';

class CategaryWidget extends StatelessWidget {
  const CategaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("categaries").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No categary found"),
            );
          }
          if (snapshot.data != null) {
            return Container(
              height: Get.height / 5.5,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CategaryModel categaryModel = CategaryModel(
                        categaryId: snapshot.data!.docs[index]['categaryId'],
                        categaryImg: snapshot.data!.docs[index]['categaryImg'],
                        categaryName: snapshot.data!.docs[index]
                            ['categaryName'],
                        createdAt: snapshot.data!.docs[index]['createdAt']);
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          // ignore: prefer_const_constructors
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 10,
                              width: Get.width / 4,
                              heightImage: Get.height / 12,
                              imageProvider: CachedNetworkImageProvider(
                                  categaryModel.categaryImg),
                              title: Center(
                                  child: Text(
                                categaryModel.categaryName,
                                style: TextStyle(fontSize: 12),
                              )),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            );
          }
          return Container();
        });
  }
}
