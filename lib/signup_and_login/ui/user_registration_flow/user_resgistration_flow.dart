import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/signup_and_login/navigator/user_registration_navigator.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/enter_business_detail_page.dart';
import 'package:bringi_app/signup_and_login/ui/kyc_approved_or_rejected_page.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/upload_business_documents_screen.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/verify_referel_code_page.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_state.dart';

class UserRegistrationFlow extends StatefulWidget {
  final int? Index;
  const UserRegistrationFlow({
    super.key,
    this.Index,
  });

  @override
  State<UserRegistrationFlow> createState() => _UserRegistrationFlowState();
}

class _UserRegistrationFlowState extends BaseState<
    UserRegistrationFlow,
    UserRegistrationViewModel,
    UserRegistrationNavigator> implements UserRegistrationNavigator {
  int? currentIndex;
  final _controller = PageController(
    initialPage: 0,
  );
  String? mobileNo;
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "",
      onTap: () {
        navigateTofirstPage();
      },
      centerTitle: false,
      backColor: Colors.white,
      requireBackButton:
          (currentIndex == 0 || currentIndex == 1 || currentIndex == 3)
              ? false
              : true,
    );
  }

  void navigateTofirstPage() {
    _controller.jumpToPage(1);
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
          builder: (context, vm, child) => VerifyReferrelCodeScreen(
            onPinsubmitted: (code) {
              vm.checkRefferelCode(code);
            },
          ),
        ),
        Consumer<UserRegistrationViewModel>(
          builder: (context, vm, child) => AddBusinessDetailScreen(
            onBusinessDetailsUploaded: (name, address) {
              vm.userCredentials.addAll({
                "shopName": name,
                "address": address,
              });
              navigateToNextPage();
            },
          ),
        ),
        Consumer<UserRegistrationViewModel>(
          builder: (context, vm, child) => UploadBusinessDocumentScreen(
            removeAllDocuments: () {
              vm.removeAllDocuments();
            },
            addDocument: (value) {
              vm.addDocuments(value);
            },
            removeDocument: (index) {
              vm.removeDocument(index - 1);
            },
            vm: vm,
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
    navigateToNextPage();
  }

  @override
  void navigateToDashboard() {
    // TODO: implement navigateToDashboard
  }

  @override
  void navigateToUserRegistrationFlow() {
    // TODO: implement navigateToUserRegistrationFlow
  }

  @override
  void navigateTonextPage() {
    _controller.nextPage(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  void navigateTOKYCscreen() {
    pushandRemoveUntill(widget: KYCstatusPage());
  }
}
