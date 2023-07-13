import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/order_tracking_and_details/order_detail_page.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/no_item_found.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../base/base_state.dart';

class RetailerHelp extends StatefulWidget {
  const RetailerHelp({super.key});

  @override
  State<RetailerHelp> createState() => _RetailerHelpState();
}

class _RetailerHelpState extends BaseState<
    RetailerHelp,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  ScrollController? _scrollController;
  String? uid;
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.filter_list_outlined,
                  ),
                ),
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: true,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Help",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 0.0,
            elevation: 0.0,
            pinned: true,
            floating: false,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                height: 50,
                child: Consumer<RetailerDashboardViewModel>(
                  builder: (context, vm, child) => TextFormField(
                    onChanged: (text) {
                      vm.setProductName = text.toUpperCase();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search Help",
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<RetailerDashboardViewModel>(
              builder: (context, vm, child) => StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Orders")
                    .where(
                      "productName",
                      isGreaterThanOrEqualTo: vm.getProductName,
                    )
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data?.docs.length == 0) {
                    return Expanded(
                      child: NoitemFoundPage(title: "No Help Found"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    print("${snapshot.error}");
                  }
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: snapshot.data?.docs.length ?? 0,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          push(
                            widget: RetailerHelpDetails(
                              orderId:
                                  snapshot.data?.docs[index].get("orderId"),
                            ),
                          );
                        },
                        child: orderDetailsCard(
                          snapshot,
                          index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Card orderDetailsCard(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index) {
    return Card(
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
            subtitle: Text("${snapshot.data?.docs[index].get("productName")}"),
            trailing: Column(
              children: [
                Text("Created on"),
                Text("${snapshot.data?.docs[index].get("createdAt")}"),
              ],
            ),
          )
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

  @override
  void onAddressSavedSucessfully() {
    // TODO: implement onAddressSavedSucessfully
  }

  void onRefresh() {}
}
