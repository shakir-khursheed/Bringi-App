// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String address;
  String kycStatus;
  String shopName;
  DateTime createdAt;
  List<String> documentUrl;
  String mobileNo;
  String role;
  String uid;

  UserModel({
    required this.address,
    required this.kycStatus,
    required this.shopName,
    required this.createdAt,
    required this.documentUrl,
    required this.mobileNo,
    required this.role,
    required this.uid,
  });

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        address: json["Address"],
        kycStatus: json["KYC-status"],
        shopName: json["ShopName"],
        createdAt: DateTime.parse(json["createdAt"]),
        documentUrl: List<String>.from(json["documentURL"].map((x) => x)),
        mobileNo: json["mobileNo"],
        role: json["role"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "KYC-status": kycStatus,
        "ShopName": shopName,
        "createdAt": createdAt.toIso8601String(),
        "documentURL": List<dynamic>.from(documentUrl.map((x) => x)),
        "mobileNo": mobileNo,
        "role": role,
        "uid": uid,
      };
}
