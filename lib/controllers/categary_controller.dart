import 'package:chatjptflutter_projecr/models/cotegary_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CategaryController extends GetxController {
  Future<void> CategaryItem(String CategaryId, String CategaryImg,
      String CategaryName, dynamic CategaryAt) async {
    CategaryModel categaryModel = CategaryModel(
        categaryId: CategaryId,
        categaryImg: CategaryImg,
        categaryName: CategaryName,
        createdAt: CategaryAt);
    await FirebaseFirestore.instance
        .collection("categaries")
        .doc(Uuid().v1())
        .set(categaryModel.tojson());
  }

  List<dynamic> listImages = [
    "https://us.123rf.com/450wm/photochicken/photochicken2008/photochicken200800065/153425631-pritty-young-asian-photographer-girl-teen-travel-with-camera-trip-take-a-photo-tourist-lifestyle.jpg?ver=6",
    "https://i.insider.com/60638bd66183e1001981966a?width=1136&format=jpeg",
    "https://www.w3schools.com/howto/img_5terre.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5GuMfS0iPEclSKxdlLwtRWSfU1dgLCfNRF_cZ7UYjh93BvUPUQb0wq9ibF0qlcKM5jPo&usqp=CAU",
    "https://media.gettyimages.com/id/1158891212/photo/colorful-landscape-view-of-vernazza-on-sunset-in-cinque-terre-liguria-italia.jpg?s=612x612&w=gi&k=20&c=IkTk0hPcyuW4DztcUGG2G3raODgOcOGydmn9Vcf3iBY=",
    "https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/07/insert-image-html.jpg",
  ];
  List<dynamic> listCategary = [
    "Winter",
    "Raining",
    "PhotoGraphic",
    "PhotoColors",
    "AzurAsses",
    "KamalAsasan",
  ];
  List<dynamic> listdata = [
    DateTime.january,
    DateTime.now(),
    DateTime.march,
    DateTime.april,
    DateTime.may,
    DateTime.june
  ];
}
