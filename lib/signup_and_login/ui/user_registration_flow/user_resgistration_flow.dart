import 'package:bringi_app/signup_and_login/navigator/login_navigator.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/pin_screen.dart';
import 'package:bringi_app/signup_and_login/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../base/base_state.dart';

class UserRegistrationFlow extends StatefulWidget {
  const UserRegistrationFlow({super.key});

  @override
  State<UserRegistrationFlow> createState() => _UserRegistrationFlowState();
}

class _UserRegistrationFlowState
    extends BaseState<UserRegistrationFlow, LoginviewModel, LoginNavigator>
    implements LoginNavigator {
  int? currentIndex;
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return PageView(
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      children: [
        PinScreen(),
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
    // TODO: implement loadPageData
  }

  @override
  void navigateToLogin() {
    // TODO: implement navigateToLogin
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
  void showMessage(String message) {
    // TODO: implement showMessage
  }

  @override
  void showNoInternetPage() {
    // TODO: implement showNoInternetPage
  }

  @override
  LoginNavigator getNavigator() {
    return this;
  }
}
