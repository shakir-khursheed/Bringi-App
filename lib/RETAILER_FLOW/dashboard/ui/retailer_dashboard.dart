import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/create_order_process/product_details.dart';
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
              Icon(
                Icons.mic,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.notifications,
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
            Consumer<RetailerDashboardViewModel>(
              builder: (context, vm, child) => (!vm.showLoading)
                  ? (vm.productList.length != 0)
                      ? Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              onRefresh();
                            },
                            child: GridView.builder(
                              itemCount: vm.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 290.0,
                              ),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  push(
                                      widget: ProductDetailPage(
                                    productId: vm.productList[index].userid,
                                  ));
                                },
                                child: ProductItem(
                                  vm,
                                  index,
                                  () {
                                    vm.addToInventory(
                                      productQuantity:
                                          vm.productList[index].packOf12,
                                      productName:
                                          vm.productList[index].productName,
                                      amount: vm.productList[index].price,
                                      count: 1,
                                      imageUrl: vm
                                          .productList[index].imageUrls[index],
                                      productId: vm.productList[index].userid,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      : NoitemFoundPage(title: "No products found")
                  : Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }

  Card ProductItem(
      RetailerDashboardViewModel vm, int index, Function addTocart) {
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
              Image(
                image: NetworkImage(vm.productList[index].imageUrls.first),
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                vm.productList[index].productName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "PRICE ₹ ${vm.productList[index].price}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "MRP ₹ ${vm.productList[index].mrp}",
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
                    "Margin ₹ ${vm.productList[index].margin}",
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
