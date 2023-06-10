import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/constants/role_identifier.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/enter_business_detail_page.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/enter_phone_no_screen.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/pin_screen.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/upload_business_documents_screen.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_state.dart';

class UserRegistrationFlow extends StatefulWidget {
  final RoleIdentifier roleIdentifier;
  const UserRegistrationFlow({super.key, required this.roleIdentifier});

  @override
  State<UserRegistrationFlow> createState() => _UserRegistrationFlowState();
}

class _UserRegistrationFlowState extends BaseState<
    UserRegistrationFlow,
    UserRegistrationViewModel,
    UserRegistrationNavigator> implements UserRegistrationNavigator {
  int? currentIndex;
  final _controller = PageController();
  String? mobileNo;
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "",
      onTap: () {
        navigateTopreviousPage();
      },
      centerTitle: false,
      backColor: Colors.white,
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
        if (widget.roleIdentifier == RoleIdentifier.MASTERDISTRIBUTOR ||
            widget.roleIdentifier == RoleIdentifier.AGENT)
          EnterPhoneNoScreen(
            onPhoneNoEntered: (value) {
              mobileNo = value;
              navigateToNextPage();
            },
          ),
        PinScreen(
          mobileNo: mobileNo,
          roleIdentifier: widget.roleIdentifier,
          onResendCodeClicked: () {
            navigateTopreviousPage();
          },
          onPinsubmitted: () {
            navigateToNextPage();
          },
        ),
        AddBusinessDetailScreen(
          roleIdentifier: widget.roleIdentifier,
          onBusinessDetailsUploaded: () {
            navigateToNextPage();
          },
        ),
        Consumer<UserRegistrationViewModel>(
          builder: (context, vm, child) => UploadBusinessDocumentScreen(vm: vm),
        )
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
    print(widget.roleIdentifier);
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
}
