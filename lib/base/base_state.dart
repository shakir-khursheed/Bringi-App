import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/create_order_process/Thank_u_screen.dart';
import 'package:bringi_app/signup_and_login/ui/verify_user_flow/verify_user_flow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_locator/service_locator.dart';
import 'base_navigator.dart';
import 'base_viewmodel.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel,
    N extends BaseNavigator> extends State<W> implements BaseNavigator {
  VM viewModel = serviceLocator<VM>();

  N getNavigator();

  Widget buildBody();

  Drawer? buildScreenDrawer();

  Color? setBackgroundColor();

  Widget? buildFloatingActionButton();

  Widget? buildBottomNavbar();

  AppBar? buildAppBar();

  @override
  void onOrderCreatedSuccessfully() {
    push(
      widget: ThankUPage(),
    );
  }

  @override
  void initState() {
    loadPageData();
    viewModel.setNavigator(getNavigator());
    super.initState();
  }

  @override
  void showMessage(String message, {Color? color}) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: (color != null) ? color : Colors.green[900],
        content: Text(message),
      ));
    }
  }

  @override
  void navigateToVerifyUserFlow() {
    pushandRemoveUntill(widget: VerifyUserFlow());
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: provideOnWillPopScopeCallBack,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            drawer: buildScreenDrawer(),
            appBar: buildAppBar(),
            backgroundColor: setBackgroundColor() ?? Colors.white,
            body: ChangeNotifierProvider.value(
              value: viewModel,
              child: buildBody(),
            ),
            floatingActionButton: buildFloatingActionButton(),
            bottomNavigationBar: buildBottomNavbar(),
          ),
        ),
      );

  void loadPageData({
    dynamic value,
  });

  void push({required Widget widget}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => widget))
        .then((value) => loadPageData(value: value));
  }

  void pushandRemoveUntill({required Widget widget}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget),
        (route) => false).then((value) => loadPageData());
  }

  void launchExternalUrl({required Uri uri, LaunchMode? mode}) async {
    if (!uri.hasEmptyPath) {
      await launchUrl(
        uri,
        mode: mode ?? LaunchMode.inAppWebView,
      );
    } else {
      showMessage("couldn't launch a $uri");
    }
  }

  void pop({dynamic result}) {
    Navigator.of(context).pop();
  }

  Future<bool> provideOnWillPopScopeCallBack();

  Widget showProgressBar() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

void onOrderCreatedSuccessfully() {}

void showDialogMethod(
    {required BuildContext context,
    required Widget builder,
    bool? barrierDismissible}) {
  showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    builder: (context) => builder,
  );
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
