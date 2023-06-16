import 'package:cloud_firestore/cloud_firestore.dart';

class RefferalCodeModel {
  final String? refferalCode;
  final String role;
  const RefferalCodeModel({required this.refferalCode, required this.role});
  factory RefferalCodeModel.fromDocument(
          DocumentSnapshot<Map<String, dynamic>>? json) =>
      RefferalCodeModel(
        refferalCode: json?["refferel"],
        role: json?["role"],
      );
  Map<String, dynamic> toJson() => {
        "refferel": refferalCode,
        "role": role,
      };
}
