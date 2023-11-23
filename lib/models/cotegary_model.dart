import 'package:get/get.dart';

class CategaryModel extends GetxController {
  final String categaryId;
  final String categaryImg;
  final String categaryName;
  final dynamic createdAt;

  CategaryModel(
      {required this.categaryId,
      required this.categaryImg,
      required this.categaryName,
      required this.createdAt});
//convert Api json to map to instance or object  isaka use ham tab karate jab api se data fetch karate h
//Create a UserModel instance from a json Map
  factory CategaryModel.fromMap(Map<String, dynamic> toMap) {
    return CategaryModel(
        categaryId: toMap['categaryId'],
        categaryImg: toMap['categaryImg'],
        categaryName: toMap['categaryName'],
        createdAt: toMap['createdAt']);
  }

  //convert object to map to json
  //Serialised the CategaryModel instance to a Json Map
  Map<String, dynamic> tojson() {
    return {
      'categaryId': categaryId,
      'categaryImg': categaryImg,
      'categaryName': categaryName,
      'createdAt': createdAt,
    };
  }
}
