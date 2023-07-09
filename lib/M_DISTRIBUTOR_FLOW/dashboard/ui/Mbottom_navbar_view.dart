import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/navigator/M-distributor_dashboard_navigator.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/M-distributor_dashboard.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/retailer_list.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/account_page.dart';
import 'package:flutter/material.dart';

import '../../../base/base_state.dart';

class MDistriButorBottomNavbarView extends StatefulWidget {
  const MDistriButorBottomNavbarView({super.key});

  @override
  State<MDistriButorBottomNavbarView> createState() =>
      _MDistriButorBottomNavbarViewState();
}

class _MDistriButorBottomNavbarViewState extends BaseState<
    MDistriButorBottomNavbarView,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  int? _selectedIndex;
  final screens = [
    MDistributorDashboard(),
    RetailerList(),
    RetailerAccountPage(),
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
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory), label: "Retailers"),
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
  MDistributorDashboardNavigator getNavigator() {
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
