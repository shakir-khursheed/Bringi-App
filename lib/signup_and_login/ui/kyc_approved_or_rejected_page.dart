import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/bottom_navbar_view.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AGENT_FLOW/dashboard/ui/bottom_navbar_view.dart';
<<<<<<< HEAD
import '../../DISTRIBUTOR_FLOW/dashboard/ui/bottom_nav_bar.dart';
import '../../M_DISTRIBUTOR_FLOW/dashboard/ui/M-distributor_dashboard.dart';
=======
import '../../DISTRIBUTOR_FLOW/dashboard/ui/distributor_dashboard.dart';
import '../../M_DISTRIBUTOR_FLOW/dashboard/ui/m-distributor_dashboard.dart';
>>>>>>> 246bdcabf763635a2add8a5cddcad5aeabb53209
import '../../base/base_state.dart';
import '../../common_resources/common_appbar.dart';
import '../../common_resources/common_button.dart';
import '../../common_resources/get_asset_image.dart';

class KYCstatusPage extends StatefulWidget {
  const KYCstatusPage({
    super.key,
  });

  @override
  State<KYCstatusPage> createState() => _KYCstatusPageState();
}

class _KYCstatusPageState extends BaseState<
    KYCstatusPage,
    UserRegistrationViewModel,
    UserRegistrationNavigator> implements UserRegistrationNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "",
      onTap: () {},
      centerTitle: false,
      backColor: Colors.white,
      requireBackButton: false,
    );
  }

  @override
  Widget buildBody() {
    return Consumer<UserRegistrationViewModel>(
      builder: (context, vm, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: (vm.showLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListWithFixedButtonAtBottom(
                children: [
                  Center(
                    child: getAssetImage(
                      "splash_logo.png",
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    (vm.KYCstatus == "PENDING")
                        ? "KYC PENDING"
                        : "KYC APPROVED",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    (vm.KYCstatus == "PENDING")
                        ? ""
                        : "Please continue and Enjoy Bringi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (vm.KYCstatus == "PENDING")
                      ? Center(
                          child: getAssetImage("waiting.png", height: 300),
                        )
                      : Center(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.yellow,
                            size: 120,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      (vm.KYCstatus == "PENDING")
                          ? "KYC IN PROCESS PLEASE WAIT WHILE WE VERIFY YOUR DETAILS"
                          : "KYC approved successfully enjoy & continue using bringi",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                fixedAtBottomChild: [
                  Expanded(
                    child: ButtonFactory.buildUniversalButtonWithText(
                      (vm.KYCstatus == "PENDING")
                          ? "Check status"
                          : "Get started",
                      context,
                      () {
                        (vm.KYCstatus == "PENDING")
                            ? vm.checkKYCstatus()
                            : navigateToDashboard(vm.role ?? "");
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }

  @override
  Widget? buildBottomNavbar() {
    return null;
  }

  @override
  Widget? buildFloatingActionButton() {
    return null;
  }

  @override
  Drawer? buildScreenDrawer() {
    return null;
  }

  @override
  UserRegistrationNavigator getNavigator() {
    return this;
  }

  @override
  void loadPageData({value}) {
    viewModel.checkKYCstatus();
  }

  @override
  void navigateToDashboard(String role) {
    print(role);
    switch (role) {
      case "RETAILER":
        {
          pushandRemoveUntill(widget: BottomNavbarViewDashboard());
          break;
        }
      case "DISTRIBUTOR":
        {
          pushandRemoveUntill(widget: BottomNavbarDistributor());
          break;
        }
      case "MASTER DISTRIBUTOR":
        {
          pushandRemoveUntill(widget: MDistributorDashboard());
          break;
        }
      case "AGENT":
        {
          pushandRemoveUntill(
            widget: BottomNavbarView(),
          );
          break;
        }
    }
  }

  @override
  void navigateToUserRegistrationFlow() {
    // TODO: implement navigateToUserRegistrationFlow
  }

  @override
  void navigateToVerifyUserFlow() {
    // TODO: implement navigateToVerifyUserFlow
  }

  @override
  void navigateTonextPage() {
    // TODO: implement navigateTonextPage
  }

  @override
  void onRefferelCodeMatch() {
    // TODO: implement onRefferelCodeMatch
  }

  @override
  Future<bool> provideOnWillPopScopeCallBack() {
    return Future.value(false);
  }

  @override
  Color? setBackgroundColor() {
    return HexColor.fromHex("#051E43");
  }

  @override
  void showNoInternetPage() {
    // TODO: implement showNoInternetPage
  }

  @override
  void navigateTOKYCscreen() {
    // TODO: implement navigateTOKYCscreen
  }

  @override
  void onOrderCreatedSuccessfully() {
    // TODO: implement onOrderCreatedSuccessfully
  }
}
