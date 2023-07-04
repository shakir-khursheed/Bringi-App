import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/account_page.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/inventory_page.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/retailer_dashboard.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/retailer_order_page.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../base/base_state.dart';

class BottomNavbarViewDashboard extends StatefulWidget {
  const BottomNavbarViewDashboard({super.key});

  @override
  State<BottomNavbarViewDashboard> createState() => _BottomNavbarViewState();
}

class _BottomNavbarViewState extends BaseState<
    BottomNavbarViewDashboard,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  int? _selectedIndex;
  final screens = [
    RetailerDashboard(),
    RetailerHelp(),
    RetailerInventory(),
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
        BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Help"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: "Inventory"),
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
  RetailerDashboardNavigator getNavigator() {
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
}
