import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/navigator/M-distributor_dashboard_navigator.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/manage_inventory_options/add_product.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/manage_inventory_options/manage_product.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../base/base_state.dart';

class ManageInventory extends StatefulWidget {
  const ManageInventory({super.key});

  @override
  State<ManageInventory> createState() => _ManageInventoryState();
}

class _ManageInventoryState extends BaseState<
    ManageInventory,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Manage Inventory",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          helpListCard(
            Hexcolor: "4872A4",
            count: Icon(
              Icons.inventory,
              color: Colors.white,
            ),
            label: "Add Products",
            onTap: () {
              push(
                widget: Addproducts(),
              );
            },
          ),
          Gap(10),
          helpListCard(
            Hexcolor: "4872A4",
            count: Icon(
              Icons.inventory,
              color: Colors.white,
            ),
            label: "Manage Products",
            onTap: () {
              push(
                widget: Manageproducts(),
              );
            },
          ),
          Gap(20),
          Text(
            "Products",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
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

  Widget helpListCard(
      {String? Hexcolor, Widget? count, String? label, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Card(
        color: HexColor.fromHex("$Hexcolor"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: ListTile(
          leading: count,
          title: Text(
            "$label",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
