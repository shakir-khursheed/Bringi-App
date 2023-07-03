import 'dart:async';
import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:bringi_app/splash_screen/navigator/splash_navigator.dart';
import 'package:bringi_app/splash_screen/repo/splash_repo.dart';

class SplashviewModel extends BaseViewModel<SplashNavigator, SplashRepo> {
  void checkAppSession() async {
    String? uid = await repository.getUid();
    String? role = await repository.getUserRole();
    String? kycStatus = await repository.getKYCSTATUS();
    Timer(const Duration(seconds: 1), () {
      print(kycStatus);
      if (uid != null &&
          uid.isNotEmpty &&
          role != null &&
          role.isNotEmpty &&
          kycStatus != null &&
          kycStatus.isNotEmpty) {
        switch (role) {
          case "RETAILER":
            {
              (kycStatus == "PENDING")
                  ? (kycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
          case "DISTRIBUTOR":
            {
              (kycStatus == "PENDING")
                  ? (kycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
          case "M-DISTRIBUTOR":
            {
              (kycStatus == "PENDING")
                  ? (kycStatus == "REJECTED")
                      ? print("KYC REJECTED")
                      : getNavigator().navigateToKYCscreen()
                  : getNavigator().navigateToDashboard(role);
              break;
            }
          case "AGENT":
            {
              (kycStatus == "PENDING")
                  ? (kycStatus == "REJECTED")
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
}
