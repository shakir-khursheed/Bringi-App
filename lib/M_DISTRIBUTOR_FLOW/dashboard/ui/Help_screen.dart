import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/no_item_found.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../base/base_state.dart';
import '../navigator/M-distributor_dashboard_navigator.dart';
import '../viewmodel/M-distributor_dashboard_viewmodel.dart';

class HelpList extends StatefulWidget {
  const HelpList({super.key});

  @override
  State<HelpList> createState() => _HelpListState();
}

class _HelpListState extends BaseState<HelpList, MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Help",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Orders").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data?.docs.length == 0) {
            return Center(child: NoitemFoundPage(title: "No Help found"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) => Card(
              elevation: 5,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Order ID",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${snapshot.data?.docs[index].get("orderId")}",
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: HexColor.fromHex("F2C357").withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Text(
                        "${snapshot.data?.docs[index].get("orderStatus")}",
                        style: TextStyle(
                          color: HexColor.fromHex("EDA944"),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "₹ ${snapshot.data?.docs[index].get("orderAmount")}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        "${snapshot.data?.docs[index].get("productName")}"),
                    trailing:
                        Text("${snapshot.data?.docs[index].get("createdAt")}"),
                  )
                ],
              ),
            ),
          );
        },
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
