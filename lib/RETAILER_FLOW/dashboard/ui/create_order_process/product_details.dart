import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
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
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("Pack of 12"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("Pack of 24"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("Pack of 60"),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("Pack of 120"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    " ₹ ${vm.product?.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  )
                ],
                fixedAtBottomChild: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                          color: HexColor.fromHex("F2C357"),
                          onPressed: () {},
                          child: Text("Add to inventory"),
                        ),
                        MaterialButton(
                          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                          color: HexColor.fromHex("F2C357"),
                          onPressed: () {
                            
                          },
                          child: Text("Checkout"),
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
  void showNoInternetPage() {
    // TODO: implement showNoInternetPage
  }
  
  @override
  void onAddressSavedSucessfully() {
    // TODO: implement onAddressSavedSucessfully
  }
}
