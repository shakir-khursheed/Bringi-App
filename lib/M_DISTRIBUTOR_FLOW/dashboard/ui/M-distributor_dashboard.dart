import 'package:flutter/material.dart';
import '../../../base/base_state.dart';
import '../navigator/M-distributor_dashboard_navigator.dart';
import '../viewmodel/M-distributor_dashboard_viewmodel.dart';

class MDistributorDashboard extends StatefulWidget {
  const MDistributorDashboard({super.key});

  @override
  State<MDistributorDashboard> createState() => _MDistributorDashboardState();
}

class _MDistributorDashboardState extends BaseState<
    MDistributorDashboard,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return Container();
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
  void navigateToVerifyUserFlow() {
    // TODO: implement navigateToVerifyUserFlow
  }

  @override
  Future<bool> provideOnWillPopScopeCallBack() {
    return Future.value(false);
  }

  @override
  Color? setBackgroundColor() {
    return null;
  }

  @override
  void showNoInternetPage() {
    // TODO: implement showNoInternetPage
  }

  @override
  MDistributorDashboardNavigator getNavigator() {
    return this;
  }
}
