import 'dart:io';

import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/signup_and_login/model/refferel_code_model.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/repo/user_registration_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class UserRegistrationViewModel
    extends BaseViewModel<UserRegistrationNavigator, UserRegistrationRepo> {
  List<File> documentProofs = [];
  Map<String, dynamic> userCredentials = Map<String, dynamic>();
  CollectionReference? Imgref;
  RefferalCodeModel? refferalCodeModelResponse;
  FirebaseAuth _auth = FirebaseAuth.instance;
  firebase_storage.Reference? ref;
  String? recievedVerificationId;
  String? role;
//getter & setters
  void addDocuments(value) {
    documentProofs.add(value);
    notifyListeners();
  }

  void removeDocument(index) {
    documentProofs.removeAt(index);
    notifyListeners();
  }

  void removeAllDocuments() {
    documentProofs.clear();
    notifyListeners();
  }

  void verifyUser(String mobileNo) async {
    showLoading = true;
    try {
      await repository.verfyUser(
        mobile: mobileNo,
        onVerificationCompleted: (credentials) async {
          await _auth.signInWithCredential(credentials).then((value) => {
                repository.setUid(value.user!.uid),
              });
        },
        onVerificationFailed: (e) {
          getNavigator().showMessage(e.toString(), color: Colors.red);
        },
        onCodeSent: (verificationId, resendToken) {
          recievedVerificationId = verificationId;
        },
        codeAutoRetrivalTimeOut: (verificationId) {},
      );
    } catch (e) {
      getNavigator().showMessage(e.toString(), color: Colors.red);
    } finally {
      showLoading = false;
    }
  }

  void VerifyOTP(String smsCode) async {
    showLoading = true;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: recievedVerificationId ?? "",
      smsCode: smsCode,
    );

    await _auth
        .signInWithCredential(credential)
        .then((value) => {
              repository.setUid(value.user!.uid),
              getNavigator().showMessage("OTP verified successfully"),
              getNavigator().navigateToUserRegistrationFlow()
            })
        .catchError((error, stackTrace) => {
              getNavigator().showMessage(
                error.toString(),
                color: Colors.red,
              )
            });
    showLoading = false;
  }

  void checkRefferelCode(String code) async {
    showLoading = true;
    try {
      var response = await repository.checkRefferelCode();
      if (response.refferalCode == code) {
        role = response.role;
        repository.setRole(response.role);
        getNavigator().onRefferelCodeMatch();
        notifyListeners();
      } else {
        getNavigator()
            .showMessage("Incorrect refferel code", color: Colors.red.shade900);
      }
    } catch (e) {
      getNavigator().showMessage(e.toString(), color: Colors.red.shade900);
    } finally {
      showLoading = false;
    }
  }
//end
}
