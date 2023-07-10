import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/create_order_process/checkout_screen.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/no_item_found.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../base/base_state.dart';

class RetailerInventory extends StatefulWidget {
  const RetailerInventory({super.key});

  @override
  State<RetailerInventory> createState() => _RetailerInventoryState();
}

class _RetailerInventoryState extends BaseState<
    RetailerInventory,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  String? uid;
  @override
  AppBar? buildAppBar() {
    return AppBar(
      backgroundColor: HexColor.fromHex("051E43"),
      title: Text("Inventory"),
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Retailer")
            .doc(uid)
            .collection("inventory")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data?.docs.length == 0) {
            return Center(
                child: NoitemFoundPage(title: "Nothing Found in inventory"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemBuilder: (context, index) => Card(
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Image(
                          image: NetworkImage(
                            snapshot.data?.docs[index].get(
                              "imageUrl",
                            ),
                          ),
                          height: 120,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data?.docs[index].get(
                                "productName",
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "₹ ${int.parse("${snapshot.data?.docs[index].get(
                                    "amount",
                                  )}") * snapshot.data?.docs[index].get(
                                    "count",
                                  )}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    (snapshot.data?.docs[index].get("count") ==
                                            1)
                                        ? viewModel.removeFromInventory(
                                            productId: snapshot
                                                .data?.docs[index]
                                                .get("productId"),
                                          )
                                        : viewModel.updateInventory(
                                            productId: snapshot
                                                .data?.docs[index]
                                                .get("productId"),
                                            count: snapshot.data?.docs[index]
                                                    .get("count") -
                                                1,
                                          );
                                  },
                                  icon: Icon(Icons.remove_circle),
                                ),
                                Text("${snapshot.data?.docs[index].get(
                                  "count",
                                )}"),
                                IconButton(
                                  onPressed: () {
                                    viewModel.updateInventory(
                                      productId: snapshot.data?.docs[index]
                                          .get("productId"),
                                      count: snapshot.data?.docs[index]
                                              .get("count") +
                                          1,
                                    );
                                  },
                                  icon: Icon(Icons.add_circle),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: HexColor.fromHex("F2C357"),
                        onPressed: () {
                          viewModel.removeFromInventory(
                            productId:
                                snapshot.data?.docs[index].get("productId"),
                          );
                        },
                        child: Text("Remove"),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: HexColor.fromHex("F2C357"),
                        onPressed: () {
                          push(
                            widget: CheckoutPage(
                              count: "${snapshot.data?.docs[index].get(
                                "count",
                              )}",
                              productQuantity: snapshot.data?.docs[index]
                                  .get("productQuantity"),
                              productName:
                                  snapshot.data?.docs[index].get("productName"),
                              Amount:
                                  "${int.parse("${snapshot.data?.docs[index].get(
                                        "amount",
                                      )}") * snapshot.data?.docs[index].get(
                                        "count",
                                      )}",
                            ),
                          );
                        },
                        child: Text("Checkout"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: snapshot.data?.docs.length ?? 0,
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
}
