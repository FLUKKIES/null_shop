import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:null_shop/model/user_model.dart';
import 'package:null_shop/service/database_sevice.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final DatabaseService _databaseService;

  AuthService({required DatabaseService dbService})
      : _databaseService = dbService;

  Future<User?> signInWithEmailAndPassword(
      {required email, required password}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!, password: password!);

    final userUid = userCredential.user?.uid;
    final user = await _databaseService.getUserFormUid(uid: userUid);
    return user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // return;
  }

  Future<User?> currentUser() async {
    if (_firebaseAuth.currentUser == null) return null;
    return await _databaseService.getUserFormUid(
        uid: _firebaseAuth.currentUser?.uid);
  }

  Future<User> createUser(
      {required email,
      required username,
      required password,
      role,
      phone,
      address,
      coin}) async {
    final userCredetial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (userCredetial.user == null) {
      throw Exception('Create user with email and password return null');
    }
    final firebaseUser = userCredetial.user;
    final newUser = User(
        uid: firebaseUser!.uid,
        email: email,
        username: username,
        phone: phone,
        address: address,
        role: "user",
        coin: 0);
    try {
      await _databaseService.createUserFormModel(user: newUser);
    } catch (e) {
      throw Exception("Failed to create user! $e");
    }

    return newUser;
  }
}
