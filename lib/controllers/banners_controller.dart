import 'dart:io';

import 'package:chatjptflutter_projecr/models/banner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class BannerController extends GetxController {
  static BannerController instance = Get.find();
  RxList<String> bannerUrl = RxList([]);
  late File promig;

  //pic image
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == 0) {
      return;
    }
    final img = File(image!.path);
    this.promig = img;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchBannerUrl();
  }

//Fetch the bannersUrl from FirebaseFirestore
  Future<void> fetchBannerUrl() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection("banners1").get();
      if (bannersSnapshot.docs.isNotEmpty) {
        bannerUrl.value = bannersSnapshot.docs.map((doc1) {
          return doc1['img'] as String;
        }).toList();
      }
      //jab hame kuch bhi FirebaseFirestore se fetch karana hota h ham aise hi fetch karate h aur get ka use ham isliye kar pa rahe ki here GetxController ko extend kiya h
    } catch (e) {
      print("Error:$e");
    }
  }

  void AccetImage(File? img) async {
    String ImgUrl = await uploadImageStorage(img!);
    print(
        "////////////////////////////////////////////////////////////////////");
    print(ImgUrl);
  }

  Future<String> uploadImageStorage(File? imageFile) async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("banners")
        .child(Uuid().v1())
        .putFile(imageFile!);

    TaskSnapshot taskSnapshot = await uploadTask;

    String imageDwnUrl = await taskSnapshot.ref.getDownloadURL();

    return imageDwnUrl;
  }

//store banner Image url in FirebaseFirestore

  Future<void> UplodImageUlr(String img1) async {
    BannerModel bannerModel = BannerModel(image: img1);

    await FirebaseFirestore.instance
        .collection("banners1")
        .doc(Uuid().v1())
        .set(bannerModel.toJson());
  }
}
