import 'package:cloud_firestore/cloud_firestore.dart';

class RefferalCodeModel {
  final String? refferalCode;
  final String role;
  const RefferalCodeModel({required this.refferalCode, required this.role});
  factory RefferalCodeModel.fromDocument(
          DocumentSnapshot<Map<String, dynamic>>? json) =>
      RefferalCodeModel(
        refferalCode: json?["refferel_code"],
        role: json?["role"],
      );
  Map<String, dynamic> toJson() => {
        "refferel_code": refferalCode,
        "role": role,
      };
}
