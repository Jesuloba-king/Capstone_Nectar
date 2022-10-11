import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? uniqueNo;
  final String? name;
  final String? email;
  final String? phoneNo;
  final String? profilePicture;
  final String? datePublished;
  final Timestamp? timestamp;

  UserModel({
    this.uid,
    this.uniqueNo,
    this.name,
    this.email,
    this.phoneNo,
    this.profilePicture,
    this.datePublished,
    this.timestamp,
  });

  static UserModel fromSnap(DocumentSnapshot? snap) {
    Map<String, dynamic> snapshot = snap!.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot["Uid"] ?? "",
      uniqueNo: snapshot["UniqueNo"] ?? "",
      name: snapshot["Name"] ?? "",
      email: snapshot["Email"] ?? "",
      phoneNo: snapshot["PhoneNo"] ?? "",
      profilePicture: snapshot["ProfilePicture"] ?? "",
      datePublished: snapshot["DatePublished"] ?? "",
      timestamp: snapshot["Timestamp"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "Uid": uid,
        "UniqueNo": uniqueNo,
        "Name": name,
        "Email": email,
        "PhoneNo": phoneNo,
        "ProfilePicture": profilePicture,
        "DatePublished": datePublished,
        "Timestamp": timestamp,
      };
}

class UseCartModel {
  final String? uid;
  final String? email;
  final String? postId;
  final dynamic id;
  final String? title;
  final dynamic price;
  final String? category;
  final String? description;
  final String? image;
  final String? datePublished;
  final Timestamp? timestamp;
  UseCartModel({
    this.uid,
    this.email,
    this.postId,
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.datePublished,
    this.timestamp,
  });

  static UseCartModel fromSnap(DocumentSnapshot? snap) {
    Map<String, dynamic> snapshot = snap!.data() as Map<String, dynamic>;
    return UseCartModel(
      uid: snapshot["Uid"] ?? "",
      email: snapshot["Email"] ?? "",
      postId: snapshot["PostId"] ?? "",
      id: snapshot["Id"] ?? 0,
      title: snapshot["Title"] ?? "",
      price: snapshot["Price"],
      category: snapshot["Category"] ?? "",
      description: snapshot["Description"] ?? "",
      image: snapshot["Image"] ?? "",
      datePublished: snapshot["DatePublished"] ?? "",
      timestamp: snapshot["Timestamp"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "Uid": uid,
        "Email": email,
        "PostId": postId,
        "Id": id,
        "Title": title,
        "Price": price,
        "Category": category,
        "Description": description,
        "Image": image,
        "DatePublished": datePublished,
        "Timestamp": timestamp,
      };
}
