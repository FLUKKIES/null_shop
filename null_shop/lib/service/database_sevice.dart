import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:null_shop/model/product_model.dart';
import 'package:null_shop/model/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  Future<void> createUserFormModel({required User user}) async {
    final docUser = _firebaseStore.collection('users').doc(user.uid);
    final Map<String, dynamic> userInfo = user.toMap();
    await docUser.set(userInfo);
  }

  Future<User?> getUserFormUid({required uid}) async {
    final docUser = _firebaseStore.collection("users").doc(uid);
    final snapshot = await docUser.get();

    if (!snapshot.exists) return null;

    final userInfo = snapshot.data();
    return User.formMap(userMap: userInfo!);
    // return user;
  }

  Future<void> updateUserFormUid({required uid, required User user}) async {
    final docUser = _firebaseStore.collection('users').doc(uid);
    // toMap() แปลง
    final newUserInfo = user.toMap();
    await docUser.set(newUserInfo);
  }

  Future<List<Product?>> getFutureListProduct() async {
    final snapshot = await _firebaseStore.collection('products').get();
    return snapshot.docs
        .map((doc) => Product.formMap(userMap: doc.data()))
        .toList();
  }
}
