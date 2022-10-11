import 'package:capstone/API_Services/models/user_model.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;
  static final User? result = FirebaseAuth.instance.currentUser;
  static String userId = "";
  static String reUserId = "";

  static Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? signedInUser = _auth.currentUser;
      userId = signedInUser!.uid;

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> signUp(
    String email,
    String password,
  ) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? signedInUser = authResult.user;
      reUserId = signedInUser!.uid;
      var allUsers = await _fireStore.collection('Users').get();
      var newId = allUsers.docs.length + 0001;
      DateTime now = DateTime.now();
      String formattedDate = DateFormat.yMMMEd().format(now);
      model.UserModel modal = model.UserModel(
        uid: signedInUser.uid,
        uniqueNo: "Open${newId.toString()}",
        name: "",
        email: email,
        phoneNo: "",
        profilePicture: "",
        datePublished: formattedDate,
      );
      signedInUser.updateEmail(email);
      _fireStore.collection('Users').doc(signedInUser.uid).set(modal.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> forgotPassword(
    String email,
  ) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> userExists(String uid) async =>
      (await _fireStore.collection('Users').where("Uid", isEqualTo: uid).get())
          .docs
          .isNotEmpty;

  void google(String userId, String email) async {
    var allUsers = await _fireStore.collection('Users').get();
    var newId = allUsers.docs.length + 0001;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);
    model.UserModel modal = model.UserModel(
      uid: userId,
      uniqueNo: "Open${newId.toString()}",
      name: "",
      email: email,
      phoneNo: "",
      profilePicture: "",
      datePublished: formattedDate,
    );
    _fireStore.collection('Users').doc(userId).set(modal.toJson());
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    userId = credential.idToken!;
    bool exist = await userExists(userId);
    if (exist) {
      userId = credential.idToken!;
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      google(userId, googleUser!.email);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    // Once signed in, return the UserCredential
  }
}
