import 'dart:async';
import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/signup_and_login/model/usermodel.dart';
import 'package:bringi_app/splash_screen/navigator/splash_navigator.dart';
import 'package:bringi_app/splash_screen/repo/splash_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashviewModel extends BaseViewModel<SplashNavigator, SplashRepo> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String? KycStatus;
  void checkAppSession() async {
    String? uid = await repository.getUid();
    String? role = await repository.getUserRole();
    String? mobileNo = await repository.getPhoneNo();
    Timer(const Duration(seconds: 1), () async {
      var response = await checkKYCstatus(mobileNO: mobileNo);
      KycStatus = response.kycStatus;
      if (uid != null && uid.isNotEmpty && role != null && role.isNotEmpty) {
        switch (role) {
          case "RETAILER":
            {
              (KycStatus == "PENDING")
                  ? (KycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
          case "DISTRIBUTOR":
            {
              (KycStatus == "PENDING")
                  ? (KycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
          case "MASTER DISTRIBUTOR":
            {
              (KycStatus == "PENDING")
                  ? (KycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
          case "AGENT":
            {
              (KycStatus == "PENDING")
                  ? (KycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
        }
      } else {
        getNavigator().navigateToVerifyUserFlow();
      }
    });
  }

  Future<UserModel> checkKYCstatus({String? mobileNO}) async {
    showLoading = true;
    var response =
        await _db.collection("Users").doc(mobileNO).get().whenComplete(() => {
              showLoading = false,
            });
    return UserModel.fromJson(response);
  }
}
