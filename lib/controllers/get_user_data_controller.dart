import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class GetUserDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async {
    final QuerySnapshot userData =
        //niche likhe gaye line ka matalab yah h ki users ke under jao aur mughe jis user ki uid mil rahi h usake document uthake hame bhej do aur
        //aur hamari jo bhi document hogi vo jakar sigh_in_screen file ke userData me store ho jayega
        await _firestore.collection('users').where('uId', isEqualTo: uId).get();
    return userData.docs;
  }
}
