import 'dart:convert';

import 'package:bringi_app/base/base_webApi.dart';
import 'package:bringi_app/signup_and_login/model/refferel_code_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRegistrationWebApi extends BaseWebApi {
  Future<RefferalCodeModel> checkRefferelCode();
  Future<void> verfyUser({
    String? mobile,
    Function? onVerificationCompleted,
    Function? onVerificationFailed,
    Function? onCodeSent,
    Function? codeAutoRetrivalTimeOut,
  });
}

class UserRegistrationWebApiImpl implements UserRegistrationWebApi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<RefferalCodeModel> checkRefferelCode() async {
    var response =
        await _db.collection("refferel_codes").doc("Refferelcode").get();
    return RefferalCodeModel.fromDocument(response);
  }

  @override
  Future<void> verfyUser({
    String? mobile,
    Function? onVerificationCompleted,
    Function? onCodeSent,
    Function? codeAutoRetrivalTimeOut,
    Function? onVerificationFailed,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: mobile,
      verificationCompleted: (PhoneAuthCredential credentails) =>
          onVerificationCompleted!(credentails),
      timeout: Duration(seconds: 30),
      verificationFailed: (FirebaseAuthException e) => onVerificationFailed!(e),
      codeSent: (String verificationId, int? resendToken) =>
          onCodeSent!(verificationId, resendToken),
      codeAutoRetrievalTimeout: (String verificationId) =>
          codeAutoRetrivalTimeOut!(verificationId),
    );
  }
}
