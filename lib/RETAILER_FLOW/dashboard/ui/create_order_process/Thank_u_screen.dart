import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/bottom_navbar_view.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../base/base_state.dart';

class ThankUPage extends StatefulWidget {
  const ThankUPage({
    super.key,
  });

  @override
  State<ThankUPage> createState() => _ThankUPageState();
}

class _ThankUPageState extends BaseState<ThankUPage, RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Thank you",
      onTap: () {},
      centerTitle: true,
      requireBackButton: false,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Consumer<RetailerDashboardViewModel>(
        builder: (context, vm, child) => ListWithFixedButtonAtBottom(
          children: [
            Center(
              child: Image(
                image: AssetImage(
                  "assets/images/thankyou.png",
                ),
              ),
            ),
            Center(
              child: Text(
                "Thank you for shoping from bringi !",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
          fixedAtBottomChild: [
            Consumer<RetailerDashboardViewModel>(
              builder: (context, vm, child) => Expanded(
                child: ButtonFactory.buildUniversalButtonWithText(
                  "Continue shoping",
                  context,
                  () {
                    pushandRemoveUntill(
                      widget: BottomNavbarViewDashboard(),
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
