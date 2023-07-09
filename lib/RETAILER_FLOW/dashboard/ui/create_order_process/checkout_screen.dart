import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/create_order_process/payment_option.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../base/base_state.dart';

class CheckoutPage extends StatefulWidget {
  final String productName;
  final String Amount;
  final String productQuantity;
  const CheckoutPage({
    super.key,
    required this.Amount,
    required this.productName,
    required this.productQuantity,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends BaseState<
    CheckoutPage,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Checkout",
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
              "Billing Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            (!vm.showLoading)
                ? addressCard(vm, 0)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Shipping Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            (!vm.showLoading)
                ? addressCard(vm, 0)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            SizedBox(
              height: 10,
            ),
            Consumer<RetailerDashboardViewModel>(
              builder: (context, value, child) => productDetailCard(),
            ),
          ],
          fixedAtBottomChild: [
            Consumer<RetailerDashboardViewModel>(
              builder: (context, vm, child) => Expanded(
                child: ButtonFactory.buildUniversalButtonWithText(
                  "Next",
                  context,
                  () {
                    vm.addToCheckout(
                      address: vm.savedAddresses.first.address,
                      totalAmount: widget.Amount,
                      productName: widget.productName,
                    );
                    push(
                      widget: PaymentOptionPage(
                        productQuantity: widget.productQuantity,
                      ),
                    );
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

  Card productDetailCard() {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.productName}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₹ ${widget.Amount}",
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              "₹ ${widget.Amount}",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w400,
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
    viewModel.getSavedAddress();
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
                    fontSize: 15,
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
