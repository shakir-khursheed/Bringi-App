import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/Manage_address/add_address.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/Manage_address/saved_address.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../base/base_state.dart';

class RetailerAccountPage extends StatefulWidget {
  const RetailerAccountPage({super.key});

  @override
  State<RetailerAccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends BaseState<
    RetailerAccountPage,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  String? uid;
  @override
  AppBar? buildAppBar() {
    return AppBar(
      backgroundColor: HexColor.fromHex("051E43"),
      title: Text("Account Settings"),
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 80,
            backgroundColor: HexColor.fromHex("051E43"),
            child: Icon(
              Icons.account_circle,
              size: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.data == null) {
                  return Text(
                    "Bringi Retailer",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return Text(
                  "${snapshot.data?.get("ShopName")}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                );
              }),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.data == null) {
                  return Text(
                    "Not available",
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return Text(
                  "${snapshot.data?.get("Address")}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                AccountSettingHeader("Address"),
                SizedBox(
                  height: 10,
                ),
                profileListItem(
                  label: "Saved Address",
                  onTap: () {
                    push(
                      widget: SavedAddressPage(),
                    );
                  },
                  icon: Icons.person_outline,
                ),
                profileListItem(
                    label: "Add address",
                    onTap: () {
                      push(
                        widget: AddAddressPage(),
                      );
                    },
                    icon: Icons.add_circle_outline),
                SizedBox(
                  height: 10,
                ),
                AccountSettingHeader("Info"),
                SizedBox(
                  height: 10,
                ),
                profileListItem(
                    label: "FAQ'S",
                    onTap: () {
                      // push(
                      //   widget: FAQScreen(),
                      // );
                    },
                    icon: Icons.help_outline),
                profileListItem(
                    label: "Help & Support",
                    onTap: () {
                      // push(
                      //   widget: SupportPage(),
                      // );
                    },
                    icon: Icons.support_agent),
                profileListItem(
                    label: "Terms & Conditions",
                    onTap: () {},
                    icon: Icons.file_copy),
                profileListItem(
                    label: "Privacy Policy",
                    onTap: () {},
                    icon: Icons.privacy_tip_outlined),
                SizedBox(
                  height: 10,
                ),
                AccountSettingHeader("Security Settings"),
                SizedBox(
                  height: 10,
                ),
                profileListItem(
                  label: "Logout",
                  onTap: () {},
                  icon: Icons.logout_outlined,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
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
  RetailerDashboardNavigator getNavigator() {
    return this;
  }

  @override
  void loadPageData({value}) async {
    uid = await viewModel.getuid();
    setState(() {});
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

  Container AccountSettingHeader(String heading) {
    return Container(
      height: 35,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            heading,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      color: Colors.grey.withOpacity(.2),
    );
  }

  Widget profileListItem({
    required IconData icon,
    required Function onTap,
    required String label,
    Widget? trailingIcon,
  }) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Icon(icon),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: (trailingIcon != null)
          ? trailingIcon
          : Icon(Icons.keyboard_arrow_right_outlined),
    );
  }

  @override
  void onAddressSavedSucessfully() {
    // TODO: implement onAddressSavedSucessfully
  }
}
