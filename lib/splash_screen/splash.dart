import 'package:flutter/material.dart';
import '../base/base_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  AppBar? buildAppBar() {
    return null;
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
          child: Image(
            image: AssetImage(
              "assets/images/splash_logo.png",
            ),
            height: 200,
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
  void loadPageData({value}) {}

  @override
  Future<bool> provideOnWillPopScopeCallBack() {
    return Future.value(false);
  }

  @override
  Color? setBackgroundColor() {
    return HexColor.fromHex("#051E43");
  }
}
