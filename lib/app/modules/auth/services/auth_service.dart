import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locafrog/app/data/models/user/user_model.dart';
import 'package:flutter_locafrog/app/modules/login/views/login_view.dart';
import 'package:flutter_locafrog/app/modules/root/views/root_view.dart';
import 'package:flutter_locafrog/app/utils/show_loading.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  Rxn<User?> firebaseUser = Rxn<User>();
  Rxn<UserModel> user = Rxn<UserModel>();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging fcm = FirebaseMessaging.instance;
  String usersCollection = "users";

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print('AuthService onInit');
    firebaseUser.value = auth.currentUser;
    firebaseUser.bindStream(auth.userChanges());
  }

  @override
  void onReady() {
    super.onReady();
    print('AuthService onReady');
    ever(firebaseUser, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginView());
    } else {
      Get.offAll(() => RootView());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String? _userId = result.user?.uid;
        if (_userId != null) {
          _initializeUserModel(_userId);
          _clearControllers();
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String? _userId = result.user?.uid;
        if (_userId != null) {
          _addUserToFirestore(_userId);
          _initializeUserModel(_userId);
          _clearControllers();
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set(
        {"name": name.text.trim(), "id": userId, "email": email.text.trim()});
  }

  _initializeUserModel(String userId) async {
    user.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  bool get isLoggedIn => firebaseUser.value == null ? false : true;
}
