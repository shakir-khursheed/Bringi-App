import 'package:bringi_app/base/base_webApi.dart';
import 'package:bringi_app/signup_and_login/model/refferel_code_model.dart';
import 'package:bringi_app/signup_and_login/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRegistrationWebApi extends BaseWebApi {
  Future<RefferalCodeModel> checkRefferelCode(
    String? mobileNO,
  );
  Future<void> verfyUser({
    String? mobile,
    Function? onVerificationCompleted,
    Function? onVerificationFailed,
    Function? onCodeSent,
    Function? codeAutoRetrivalTimeOut,
  });
  Future<void> registerUser({
    String? uid,
    String? mobileNo,
    String? name,
    String? address,
    List<String>? downloadUrl,
    String? createdAt,
    String? role,
  });
  Future<UserModel> checkKYCstatus({String? uid});
  Future<UserModel> checkDoesUserExists({String? uid});
}

class UserRegistrationWebApiImpl implements UserRegistrationWebApi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<RefferalCodeModel> checkRefferelCode(
    String? mobileNO,
  ) async {
    var response = await _db
        .collection("refferel_codes")
        .doc(
          mobileNO,
        )
        .get();
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

  @override
  Future<void> registerUser(
      {String? uid,
      String? mobileNo,
      String? name,
      String? address,
      List<String>? downloadUrl,
      String? createdAt,
      String? role}) async {
    var response = await _db.collection("Users").doc(uid).get();
    if (response.exists) {
      throw Exception("User already exists");
    } else {
      _db.collection("Users").doc(uid).set({
        "ShopName": name,
        "Address": address,
        "mobileNo": mobileNo,
        "documentURL": downloadUrl,
        "createdAt": createdAt,
        "role": role,
        "KYC-status": "PENDING",
        "uid": uid,
      });
    }
  }

  @override
  Future<UserModel> checkKYCstatus({String? uid}) async {
    var response = await _db.collection("Users").doc(uid).get();
    return UserModel.fromJson(response);
  }

  Future<UserModel> checkDoesUserExists({String? uid}) async {
    var response = await _db.collection("Users").doc(uid).get();
    return UserModel.fromJson(response);
  }
}
