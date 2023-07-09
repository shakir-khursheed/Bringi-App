import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/account_page.dart';
import 'package:flutter/material.dart';

import '../../../base/base_state.dart';
import '../navigator/agent_dashboard_navigator.dart';
import '../viewmodel/agent_dashboard_viewmodel.dart';
import 'account_details.dart';
import 'help_history.dart';
import 'help_page.dart';

class BottomNavbarView extends StatefulWidget {
  const BottomNavbarView({super.key});

  @override
  State<BottomNavbarView> createState() => _BottomNavbarViewState();
}

class _BottomNavbarViewState extends BaseState<
    BottomNavbarView,
    AgentDashboardViewModel,
    AgentDashboardNavigator> implements AgentDashboardNavigator {
  int? _selectedIndex;
  final screens = [
    HelpScreen(),
    HelpHistory(),
    Account(),
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Help"),
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory), label: "Help History"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: "Account"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Logout"),
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
  AgentDashboardNavigator getNavigator() {
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
