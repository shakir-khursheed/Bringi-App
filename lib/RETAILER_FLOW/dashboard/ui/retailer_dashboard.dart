import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/create_order_process/product_details.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/notifications.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/no_item_found.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/base_state.dart';

class RetailerDashboard extends StatefulWidget {
  const RetailerDashboard({super.key});

  @override
  State<RetailerDashboard> createState() => _RetailerDashboardState();
}

class _RetailerDashboardState extends BaseState<
    RetailerDashboard,
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
            centerTitle: true,
            titleSpacing: 0.0,
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.card_travel,
                  ),
                ),
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: true,
            backgroundColor: HexColor.fromHex("051E43"),
            title: StreamBuilder<DocumentSnapshot>(
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
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  );
                }),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 0.0,
            actions: [
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  push(widget: Notifications());
                },
                icon: Icon(
                  Icons.notifications,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: false,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  onChanged: (text) {},
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
                    hintText: "Search Products",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Container(
                  child: Center(
                      child: Image(
                    image: AssetImage(
                      "assets/images/splash_logo.png",
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 150,
                padEnds: true,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  label: Text("Default sort"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: viewModel.getMasterProducts(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data?.docs.length == 0) {
                        return Center(
                          child: NoitemFoundPage(
                            title: "No products Found",
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.builder(
                        itemCount: snapshot.data?.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 300.0,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            push(
                              widget: ProductDetailPage(
                                productId: snapshot.data?.docs[index].get(
                                  "productId",
                                ),
                              ),
                            );
                          },
                          child: ProductItem(
                            snapshot,
                            index,
                            () {
                              viewModel.addToInventory(
                                  productName: snapshot.data?.docs[index]
                                      .get("productName"),
                                  productId: snapshot.data?.docs[index]
                                      .get("productId"),
                                  productQuantity: snapshot.data?.docs[index]
                                      .get("productQuantity"),
                                  count: 1,
                                  amount: snapshot.data?.docs[index]
                                      .get("packof12Price"),
                                  imageUrl: snapshot.data?.docs[index]
                                      .get("imageUrl"));
                            },
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Card ProductItem(
      AsyncSnapshot<QuerySnapshot> vm, int index, Function addTocart) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              (vm.data?.docs[index].get("imageUrl") != null)
                  ? Image(
                      image: NetworkImage(
                        vm.data?.docs[index].get("imageUrl"),
                      ),
                      height: 130,
                    )
                  : Text("No image Available"),
              SizedBox(
                height: 20,
              ),
              Text(
                vm.data?.docs[index].get("productName"),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "PRICE ₹ ${vm.data?.docs[index].get("packof12Price")}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "MRP ₹ ${vm.data?.docs[index].get("mrpf12Pack")}",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Margin ₹ ${vm.data?.docs[index].get("marginof12Pack")}",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            addTocart();
          },
          icon: Icon(
            Icons.add_circle,
            size: 30,
            color: Colors.yellow[600],
          ),
        )
      ]),
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
    viewModel.getProducts();
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

  void onRefresh() {
    viewModel.getProducts();
  }

  @override
  void onAddressSavedSucessfully() {
    // TODO: implement onAddressSavedSucessfully
  }
}
