import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/retailer_dashboard.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow/user_resgistration_flow.dart';
import 'package:bringi_app/signup_and_login/ui/verify_user_flow_screens/enter_phone_no_screen.dart';
import 'package:bringi_app/signup_and_login/ui/verify_user_flow_screens/verify_otp_screen.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../AGENT_FLOW/dashboard/ui/agent_dashboard.dart';
import '../../../DISTRIBUTOR_FLOW/dashboard/ui/distributor_dashboard.dart';
import '../../../M_DISTRIBUTOR_FLOW/dashboard/ui/M-distributor_dashboard.dart';
import '../../../RETAILER_FLOW/dashboard/ui/bottom_navbar_view.dart';
import '../../../base/base_state.dart';

class VerifyUserFlow extends StatefulWidget {
  const VerifyUserFlow({super.key});

  @override
  State<VerifyUserFlow> createState() => _VerifyUserFlowState();
}

class _VerifyUserFlowState extends BaseState<
    VerifyUserFlow,
    UserRegistrationViewModel,
    UserRegistrationNavigator> implements UserRegistrationNavigator {
  int? currentIndex;
  final _controller = PageController();
  String? mobile;
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "",
      onTap: () {
        navigateTopreviousPage();
      },
      centerTitle: false,
      backColor: Colors.white,
      requireBackButton: false,
    );
  }

  @override
  Widget buildBody() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _controller,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      children: [
        Consumer<UserRegistrationViewModel>(
          builder: (context, vm, child) => EnterPhoneNoScreen(
            showLoading: vm.showLoading,
            onPhoneNoEntered: (value) {
              vm.showLoading = true;
              mobile = "+91$value";
              vm.verifyUser(mobile ?? "");
              vm.startTimerFunc();
              navigateToNextPage();
            },
          ),
        ),
        Consumer<UserRegistrationViewModel>(
          builder: (context, vm, child) => VerifyOTPScreen(
            showLoading: vm.showLoading,
            mobileNo: mobile,
            onPinsubmitted: (code) {
              vm.VerifyOTP(code);
            },
            onResendCodeClicked: () {
              vm.resendCode();
              navigateTopreviousPage();
            },
          ),
        ),
      ],
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
  void loadPageData({value}) {}

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
  UserRegistrationNavigator getNavigator() {
    return this;
  }

  void navigateToNextPage() {
    _controller.nextPage(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void navigateTopreviousPage() {
    _controller.previousPage(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  void navigateToVerifyUserFlow() {
    // TODO: implement navigateToVerifyUserFlow
  }

  @override
  void onRefferelCodeMatch() {
    // TODO: implement onRefferelCodeMatch
  }

  @override
  void navigateToDashboard(String role) {
    switch (role) {
      case "RETAILER":
        {
          pushandRemoveUntill(widget: BottomNavbarViewDashboard());
          break;
        }
      case "DISTRIBUTOR":
        {
          pushandRemoveUntill(widget: DistributorDashboard());
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
            widget: AgentDashboard(),
          );
          break;
        }
    }
  }

  @override
  void navigateToUserRegistrationFlow() {
    pushandRemoveUntill(widget: UserRegistrationFlow());
  }

  @override
  void navigateTonextPage() {
    navigateToNextPage();
  }

  @override
  void navigateTOKYCscreen() {
    // TODO: implement navigateTOKYCscreen
  }
}
