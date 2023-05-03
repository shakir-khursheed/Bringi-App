import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/src/material/drawer.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import '../base/base_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return ListWithFixedButtonAtBottom(
      children: [
        getAssetImage(
          "splash_logo.png",
          height: 100,
        ),
      ],
      fixedAtBottomChild: [],
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
  Future<bool> provideOnWillPopScopeCallBack() {
    return Future.value(false);
  }

  @override
  Color? setBackgroundColor() {
    return HexColor.fromHex("#051E43");
  }
}
