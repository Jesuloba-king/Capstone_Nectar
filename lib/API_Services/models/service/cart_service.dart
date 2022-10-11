import 'dart:io';

import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/API_Services/models/user_model.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CartModelService {
  static final _fireStore = FirebaseFirestore.instance;
  static final User? result = FirebaseAuth.instance.currentUser;
  String publicKeyTest =
      'pk_test_ieu49ej839u984urenewuwe06eishra'; //pass in the public test key obtained from paystack dashboard here

  final plugin = PaystackPlugin();

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

  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  Future<void> chargeCard(
      {required BuildContext context,
      required int amount,
      required String email}) async {
    var charge = Charge()
      ..amount = amount *
          100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = email;

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database
      debugPrint('Payment was successful!!!');
    } else {
      //the payment wasn't successful or the user cancelled the payment
      debugPrint('Payment Failed!!!');
    }
  }
}
