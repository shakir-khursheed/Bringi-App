import 'package:flutter/material.dart';

import '../../../base/base_state.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';
import 'accountdetails.dart';
import 'agents_view.dart';
import 'distributor_dashboard.dart';
import 'help.dart';

class BottomNavbarDistributor extends StatefulWidget {
  const BottomNavbarDistributor({super.key});

  @override
  State<BottomNavbarDistributor> createState() =>
      _BottomNavbarDistributorState();
}

class _BottomNavbarDistributorState extends BaseState<
    BottomNavbarDistributor,
    DistributorDashboardViewModel,
    DistributorDashboardNavigator> implements DistributorDashboardNavigator {
  int? _selectedIndex;
  final screens = [
    DistributorDashboard(),
    Agents(),
    HelpView(),
    AccountDetails(),
  ];
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return screens[_selectedIndex ?? 0];
  }

  @override
  Widget? buildBottomNavbar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex ?? 0,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: HexColor.fromHex("051E43"),
      selectedItemColor: Colors.yellow[500],
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Agent"),
        BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Help"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Account"),
      ],
    );
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
  DistributorDashboardNavigator getNavigator() {
    return this;
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
    return Future.value(true);
  }

  @override
  Color? setBackgroundColor() {
    return null;
  }

  @override
  void showNoInternetPage() {
    // TODO: implement showNoInternetPage
  }
}
