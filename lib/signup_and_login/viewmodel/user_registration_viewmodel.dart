import 'dart:async';
import 'dart:io';

import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/signup_and_login/model/refferel_code_model.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/repo/user_registration_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UserRegistrationViewModel
    extends BaseViewModel<UserRegistrationNavigator, UserRegistrationRepo> {
  List<File> documentProofs = [];
  List<String> documenturls = [];
  Map<String, dynamic> userCredentials = Map<String, dynamic>();
  CollectionReference? Imgref;
  RefferalCodeModel? refferalCodeModelResponse;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? recievedVerificationId;
  String? role;
  Timer? timer;
  int startTimer = 30;
  String time = '00.00';
  String? KYCstatus;

  void startTimerFunc() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (startTimer > 0) {
        startTimer--;
        int minutes = startTimer ~/ 60;
        int seconds = startTimer % 60;
        time = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        notifyListeners();
      } else {
        timer?.cancel();
      }
    });
  }

  void resendCode() {
    startTimer = 30;
    notifyListeners();
  }

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

  void uploadDocuments() async {
    var uid = await repository.getUid();
    showLoading = true;
    try {
      for (int i = 0; i < documentProofs.length; i++) {
        await _firebaseStorage
            .ref()
            .child("KYC-Documents/$uid/${documentProofs[i]}")
            .putFile(documentProofs[i])
            .then((p0) async {
          return p0.ref.getDownloadURL().then((downloadurl) async {
            return documenturls.add(downloadurl);
          });
        });
      }
      getNavigator().showMessage("Documents uploaded successfully");
      userCredentials.addAll({
        "createdAt": DateTime.now().toString(),
      });
      registerUser();
    } catch (e) {
      print(e);
    }
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
          getNavigator().showMessage(
            e.toString(),
            color: Colors.red[900],
          );
        },
        onCodeSent: (verificationId, resendToken) {
          recievedVerificationId = verificationId;
          repository.setPhoneNo(mobileNo);
        },
        codeAutoRetrivalTimeOut: (verificationId) {},
      );
    } catch (e) {
      getNavigator().showMessage(e.toString(), color: Colors.red[900]);
    } finally {
      showLoading = false;
    }
  }

  void registerUser() async {
    var mobileNo = await repository.getPhoneNo();
    showLoading = true;
    try {
      await repository.registerUser(
        mobileNo: mobileNo,
        name: userCredentials["shopName"],
        address: userCredentials["address"],
        downloadUrl: documenturls,
        createdAt: userCredentials["createdAt"],
        role: await repository.getUserRole(),
      );
      getNavigator().navigateTOKYCscreen();
      getNavigator().showMessage(
        "User registered successfully. wait for KYC to be approved",
      );
      repository.setKYCSTATUS("PENDING");
    } catch (e) {
      getNavigator().showMessage(e.toString(), color: Colors.red[900]);
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

    await _auth.signInWithCredential(credential).then((value) async {
      repository.setUid(value.user!.uid);
      role = await repository.getUserRole();
      getNavigator().showMessage("OTP verified successfully");
      var doesUserExist = await checkDoesUserExists();
      if (doesUserExist) {
        getNavigator().navigateToDashboard(role ?? '');
      } else {
        getNavigator().navigateToUserRegistrationFlow();
      }
    }).catchError((error, stackTrace) {
      getNavigator().showMessage(
        "Invalid OTP ${error}",
        color: Colors.red[900],
      );
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

  void checkKYCstatus() async {
    showLoading = true;
    try {
      var response = await repository.checkKYCstatus();
      KYCstatus = response.kycStatus;
      role = response.role;
      repository.setKYCSTATUS(KYCstatus ?? "PENDING");
      notifyListeners();
    } catch (e) {
      getNavigator().showMessage(e.toString(), color: Colors.red.shade900);
    } finally {
      showLoading = false;
    }
  }

  Future<bool> checkDoesUserExists() async {
    var uid = await repository.getUid();
    try {
      var response = await repository.checkKYCstatus();
      var responseUid = response.uid;
      if (uid != null && uid == responseUid) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    } finally {
      showLoading = false;
    }
    return false;
  }

//end
}
