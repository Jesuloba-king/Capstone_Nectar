import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/API_Services/models/user_model.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CartModelService {
  static final _fireStore = FirebaseFirestore.instance;
  static final User? result = FirebaseAuth.instance.currentUser;

  static Future<bool> addToCart(
    String uid,
    String price,
    int id,
    String title,
    String category,
    String description,
    String image,
  ) async {
    try {
      User? result = FirebaseAuth.instance.currentUser;
      String uniqueId = const Uuid().v1();
      DateTime now = DateTime.now();
      String formattedDate = DateFormat.yMMMEd().format(now);
      if (result != null) {
        model.UseCartModel modol = model.UseCartModel(
          uid: result.uid,
          postId: uniqueId,
          email: result.email,
          price: price,
          id: id,
          title: title,
          category: category,
          description: description,
          image: image,
          datePublished: formattedDate,
          timestamp: Timestamp.fromDate(
            DateTime.now(),
          ),
        );
        await _fireStore
            .collection('Users')
            .doc(uid)
            .collection("UserCart")
            .doc(uniqueId)
            .set(modol.toJson());
        return true;
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<UseCartModel>> retrieveCart(String userId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _fireStore
        .collection('Users')
        .doc(userId)
        .collection('UserCart')
        .orderBy('Timestamp', descending: true)
        .get();
    return snapshot.docs
        .map((docsSnapshot) => UseCartModel.fromSnap(docsSnapshot))
        .toList();
  }

  Future<String> deleteCart(String postId, String userId) async {
    String res = "Some error occurred";
    try {
      await _fireStore
          .collection('Users')
          .doc(userId)
          .collection("UserCart")
          .doc(postId)
          .delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
