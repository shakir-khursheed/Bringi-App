import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../base/base_state.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends BaseState<
    AddAddressPage,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  final _formKey = GlobalKey<FormState>();
  String? address;
  String? city;
  String? pincode;
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
        title: "Add address",
        onTap: () {
          pop();
        },
        centerTitle: true);
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Form(
        key: _formKey,
        child: ListWithFixedButtonAtBottom(
          children: [
            Text("Address"),
            SizedBox(
              height: 10,
            ),
            CommonInputField(
              onTextChange: (Text) {
                address = Text;
              },
              labelText: "Address",
              textInputType: TextInputType.streetAddress,
              fieldValidator: (value) {
                if (value.toString().isEmpty) {
                  return "Address cannot be empty";
                }
              },
              maxlength: 100,
              isAutovalidateModeon: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text("City"),
            SizedBox(
              height: 10,
            ),
            CommonInputField(
              onTextChange: (Text) {
                city = Text;
              },
              labelText: "Enter city",
              textInputType: TextInputType.streetAddress,
              fieldValidator: (value) {
                if (value.toString().isEmpty) {
                  return "City cannot be empty";
                }
              },
              maxlength: 100,
              isAutovalidateModeon: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Pincode"),
            SizedBox(
              height: 10,
            ),
            CommonInputField(
              onTextChange: (Text) {
                pincode = Text;
              },
              labelText: "Enter pincode",
              textInputType: TextInputType.number,
              fieldValidator: (value) {
                if (value.toString().isEmpty) {
                  return "Pincode cannot be empty";
                }
                if (value.toString().length < 6 &&
                    value.toString().isNotEmpty) {
                  return "Pincode cannot be empty";
                }
              },
              maxlength: 100,
              isAutovalidateModeon: false,
            ),
          ],
          fixedAtBottomChild: [
            Consumer<RetailerDashboardViewModel>(
              builder: (context, vm, child) => Expanded(
                child: ButtonFactory.buildUniversalButtonWithText(
                  "Add ",
                  context,
                  () {
                    if (_formKey.currentState!.validate()) {
                      vm.saveAddress(
                        address: address,
                        city: city,
                        pincode: pincode,
                      );
                    }
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
  void loadPageData({value}) {}

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
    pop();
  }
}
