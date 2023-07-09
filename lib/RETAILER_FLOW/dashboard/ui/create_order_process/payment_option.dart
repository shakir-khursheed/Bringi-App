import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../base/base_state.dart';

class PaymentOptionPage extends StatefulWidget {
  final String productQuantity;
  const PaymentOptionPage({
    super.key,
    required this.productQuantity,
  });

  @override
  State<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

enum PaymentOptions {
  COD,
  payonline,
  none,
}

class _PaymentOptionPageState extends BaseState<
    PaymentOptionPage,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  PaymentOptions _options = PaymentOptions.COD;
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Choose payment option",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Consumer<RetailerDashboardViewModel>(
        builder: (context, vm, child) => ListWithFixedButtonAtBottom(
          children: [
            Text(
              "Payment methods",
            ),
            ListTile(
              leading: Radio(
                value: PaymentOptions.COD,
                groupValue: _options,
                onChanged: (value) {
                  setState(() {
                    _options = value ?? PaymentOptions.none;
                  });
                },
              ),
              title: Text("COD"),
            ),
            ListTile(
              leading: Radio(
                value: PaymentOptions.payonline,
                groupValue: _options,
                onChanged: (value) {
                  setState(() {
                    _options = value ?? PaymentOptions.none;
                  });
                },
              ),
              title: Text("Pay online"),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: (_options == PaymentOptions.payonline) ? true : false,
              child: Row(
                children: [
                  Expanded(
                    child: ButtonFactory.buildUniversalButtonWithText(
                      "Pay with Razorpay",
                      context,
                      () {},
                      buttonColor: HexColor.fromHex("F2C357"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<RetailerDashboardViewModel>(
                builder: (context, vm, child) => Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${vm.checkoutProductResponse?.productName}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹ ${vm.checkoutProductResponse?.amount}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Delivery charges : ₹ 50",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Coupon  Applied",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Null",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Text(
                              "Total amount",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                              "₹ ${vm.checkoutProductResponse?.amount}",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
          ],
          fixedAtBottomChild: [
            Consumer<RetailerDashboardViewModel>(
              builder: (context, vm, child) => Expanded(
                child: ButtonFactory.buildUniversalButtonWithText(
                  "Place order ₹ ${vm.checkoutProductResponse?.amount}",
                  context,
                  () {
                    (_options == PaymentOptions.COD)
                        ? vm.CreateOrder(
                            orderId: vm.checkoutProductResponse?.orderId,
                            deliveryAddress:
                                vm.checkoutProductResponse?.address,
                            orderAmount: vm.checkoutProductResponse?.amount,
                            orderCount: "1",
                            productName:
                                vm.checkoutProductResponse?.productName,
                            productQuantity: widget.productQuantity,
                            orderStatus: "PENDING",
                            AssignedTo: "",
                            createdAt: DateTime.now().toString(),
                            updatedAt: "",
                          )
                        : null;
                  },
                  buttonColor: HexColor.fromHex("F2C357"),
                  showLoading: vm.showLoading,
                ),
              ),
            ),
          ],
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
  RetailerDashboardNavigator getNavigator() {
    return this;
  }

  @override
  void loadPageData({value}) {
    viewModel.getCheckoutProduct();
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
  void onAddressSavedSucessfully() {}

  Card addressCard(RetailerDashboardViewModel vm, int index) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_pin,
              size: 25,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${vm.savedAddresses[index].address}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("${vm.savedAddresses[index].city}"),
                SizedBox(
                  height: 5,
                ),
                Text("${vm.savedAddresses[index].pincode}"),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
