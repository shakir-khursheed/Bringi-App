import 'package:bringi_app/RETAILER_%20APP_FLOW/dashboard/ui/retailer_dashboard.dart';
import 'package:bringi_app/signup_and_login/ui/kyc_approved_or_rejected_page.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow/user_resgistration_flow.dart';
import 'package:bringi_app/signup_and_login/ui/verify_user_flow/verify_user_flow.dart';
import 'package:bringi_app/splash_screen/navigator/splash_navigator.dart';
import 'package:bringi_app/splash_screen/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../base/base_state.dart';
import '../../common_resources/get_asset_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BaseState<SplashScreen, SplashviewModel, SplashNavigator>
    implements SplashNavigator {
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  SplashNavigator getNavigator() {
    return this;
  }

  @override
  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: getAssetImage(
            "splash_logo.png",
            height: 140,
          ),
        ),
        const SizedBox(
          height: 10,
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
  void loadPageData({value}) {
    viewModel.checkAppSession();
  }

  @override
  void navigateToVerifyUserFlow() {
    pushandRemoveUntill(
      widget: VerifyUserFlow(),
    );
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
  void navigateToDashboard() {
    pushandRemoveUntill(widget: RetailerDashboard());
  }

  @override
  void navigateToKYCscreen() {
    pushandRemoveUntill(widget: KYCstatusPage());
  }
}
