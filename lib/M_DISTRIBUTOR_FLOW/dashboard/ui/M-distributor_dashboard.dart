import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/Help_screen.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/account_page.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return commonAppbarForScreens(
        title: "Areeb Malik",
        onTap: () {},
        centerTitle: true,
        requireBackButton: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              ))
        ]);
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Help",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(10),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              children: [
                helpGridCard(
                  Hexcolor: "EDA944",
                  count: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  label: "All Help",
                  onTap: () {},
                ),
                helpGridCard(
                  Hexcolor: "4872A4",
                  count: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  label: "Processing",
                  onTap: () {},
                ),
                helpGridCard(
                  Hexcolor: "000000",
                  count: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  label: "pickup help",
                  onTap: () {},
                ),
                helpGridCard(
                  Hexcolor: "48742C",
                  count: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  label: "Delivered",
                  onTap: () {},
                ),
                helpGridCard(
                  Hexcolor: "AA1C13",
                  count: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  label: "cancelled",
                  onTap: () {},
                ),
              ],
            ),
          ),
          Gap(20),
          Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Help List",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(5),
                helpListCard(
                  Hexcolor: "4872A4",
                  count: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  label: "Help",
                  onTap: () {
                    push(
                      widget: HelpList(),
                    );
                  },
                ),
              ],
            ),
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Master Management",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                helpListCard(
                  Hexcolor: "4872A4",
                  count: Icon(
                    Icons.inventory,
                    color: Colors.white,
                  ),
                  label: "Manage inventory",
                  onTap: () {},
                ),
                helpListCard(
                  Hexcolor: "B694A6",
                  count: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  label: "Manage agents",
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget helpGridCard({
    String? Hexcolor,
    required Widget count,
    String? label,
    Function? onTap,
  }) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(20),
            Expanded(
              child: count,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 2,
                  color: Colors.white,
                )),
              ],
            ),
            Expanded(
                child: Text(
              "$label",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
          ],
        ),
      ),
    );
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
