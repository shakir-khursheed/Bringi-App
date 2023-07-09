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
          stream: FirebaseFirestore.instance
              .collection("Retailer")
              .doc()
              .collection("orders")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data?.docs.length == 0) {
              return Center(child: NoitemFoundPage(title: "No Help found"));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) => Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Gap(10),
                          Text(
                            snapshot.data?.docs[index].get("OrderId"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.mobile_screen_share),
                          Gap(10),
                          Text(
                            snapshot.data?.docs[index].get("productName"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Gap(10),
                          Text(
                            snapshot.data?.docs[index].get("orderAmount"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
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
