import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/create_order_process/checkout_screen.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../base/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends BaseState<
    ProductDetailPage,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  final PageController _controller = PageController();
  String? orderAmount;
  String? productQuantity;
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Product",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Consumer<RetailerDashboardViewModel>(
            builder: (context, vm, child) => Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: 200,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: vm.product?.imageUrls.length,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Center(
                          child: (vm.product?.imageUrls[index] != null)
                              ? Image(
                                  image: NetworkImage(
                                      vm.product?.imageUrls[index] ?? ""),
                                  height: 400,
                                )
                              : CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _controller.previousPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.linear);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.linear);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<RetailerDashboardViewModel>(
            builder: (context, vm, child) => Expanded(
              child: ListWithFixedButtonAtBottom(
                children: [
                  Text(
                    vm.product?.productName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price : ₹ ${vm.product?.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "MRP : ₹ ${vm.product?.mrp}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Margin : ₹ ${vm.product?.margin}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    vm.product?.description ?? "",
                    maxLines: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          orderAmount = vm.product?.packOf12;
                          productQuantity = "PACK OF 12";
                          vm.setIs60Selected = false;
                          vm.setIs120Selected = false;
                          vm.setIs24Selected = false;
                          vm.setIs12Selected = true;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: (vm.is12Selected ?? false)
                                ? Colors.green
                                : Colors.grey,
                          )),
                          child: Text("Pack of 12"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          orderAmount = vm.product?.packOf24;
                          productQuantity = "PACK OF 24";
                          vm.setIs60Selected = false;
                          vm.setIs120Selected = false;
                          vm.setIs24Selected = true;
                          vm.setIs12Selected = false;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: (vm.is24Selected ?? false)
                                ? Colors.green
                                : Colors.grey,
                          )),
                          child: Text("Pack of 24"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          orderAmount = vm.product?.packOf60;
                          productQuantity = "PACK OF 60";
                          vm.setIs60Selected = true;
                          vm.setIs120Selected = false;
                          vm.setIs24Selected = false;
                          vm.setIs12Selected = false;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: (vm.is60Selected ?? false)
                                ? Colors.green
                                : Colors.grey,
                          )),
                          child: Text("Pack of 60"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          orderAmount = vm.product?.packOf120;
                          productQuantity = "PACK OF 120";
                          vm.setIs60Selected = false;
                          vm.setIs120Selected = true;
                          vm.setIs24Selected = false;
                          vm.setIs12Selected = false;
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: (vm.is120Selected ?? false)
                                ? Colors.green
                                : Colors.grey,
                          )),
                          child: Text("Pack of 120"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    " ₹ ${(orderAmount != null) ? orderAmount : vm.product?.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
                fixedAtBottomChild: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            color: HexColor.fromHex("F2C357"),
                            onPressed: () {
                              vm.addToInventory(
                                productQuantity:
                                    productQuantity ?? "Pack of 12",
                                productName: vm.product?.productName,
                                amount: orderAmount ?? vm.product?.price ?? "",
                                count: 1,
                                imageUrl: vm.product?.imageUrls.first,
                                productId: vm.product?.userid,
                              );
                            },
                            child: (!vm.loading)
                                ? Text(
                                    "Add to inventory",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )),
                        MaterialButton(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                          color: HexColor.fromHex("F2C357"),
                          onPressed: () {
                            push(
                              widget: CheckoutPage(
                                productQuantity:
                                    productQuantity ?? "Pack of 12",
                                productName: vm.product?.productName ?? "",
                                Amount: orderAmount ?? vm.product?.price ?? "",
                              ),
                            );
                          },
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
  void loadPageData({value}) {
    viewModel.getProductDetails(widget.productId);
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
  void showNoInternetPage() {}

  @override
  void onAddressSavedSucessfully() {}
}
