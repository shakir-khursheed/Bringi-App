import 'dart:io';

import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/navigator/M-distributor_dashboard_navigator.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';

import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/common_resources/pick_image_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_state.dart';

class Addproducts extends StatefulWidget {
  const Addproducts({super.key});

  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends BaseState<
    Addproducts,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  final _formkey = GlobalKey<FormState>();
  String? productName;
  String? productDiscription;
  File? productImage;
  PickImageBottomSheet _pickImageBottomSheet = PickImageBottomSheet();
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Add products",
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
        horizontal: 20,
        vertical: 20,
      ),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: (productImage?.path != null && productImage?.path != "")
                  ? Image(
                      image: FileImage(productImage!),
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image(
                      image: AssetImage(
                        "assets/images/splash_logo.png",
                      ),
                      height: 200,
                    ),
            ),
            Gap(20),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    color: HexColor.fromHex("EBC351"),
                    onPressed: () {
                      _pickImageBottomSheet.showPicImageBottomSheet(
                        title: "Pick product image",
                        subTitle:
                            "Product image is important for retailer view",
                        onCameraPicked: () async {
                          var pickedImage = await _pickImageBottomSheet
                              .pickImage(ImageSource.camera);
                          productImage = File(pickedImage?.path ?? "");
                          setState(() {});
                        },
                        onGalleryPicked: () async {
                          var pickedImage = await _pickImageBottomSheet
                              .pickImage(ImageSource.gallery);
                          productImage = File(pickedImage?.path ?? "");
                          setState(() {});
                        },
                        context: context,
                      );
                    },
                    child: Text("Pick Image"),
                  ),
                ),
              ],
            ),
            Gap(20),
            Row(
              children: [
                Text(
                  "Product Details",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Gap(10),
            Expanded(
              child: ListWithFixedButtonAtBottom(
                children: [
                  CommonInputField(
                    onTextChange: (value) {
                      productName = value;
                    },
                    labelText: "Product name",
                    textInputType: TextInputType.name,
                    fieldValidator: (value) {
                      if (value.toString().isEmpty) {
                        return "Product name cannot be empty";
                      }
                    },
                    maxlength: 100,
                    isAutovalidateModeon: false,
                  ),
                  Gap(10),
                  CommonInputField(
                    onTextChange: (value) {
                      productDiscription = value;
                    },
                    labelText: "Product discription",
                    textInputType: TextInputType.multiline,
                    fieldValidator: (value) {
                      if (value.toString().isEmpty) {
                        return "Product name cannot be empty";
                      }
                    },
                    maxlength: 5000,
                    maxlines: 10,
                    isAutovalidateModeon: false,
                  ),
                ],
                fixedAtBottomChild: [
                  Consumer<MDistributorDashboardViewModel>(
                    builder: (context, vm, child) => Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        color: HexColor.fromHex("EBC351"),
                        onPressed: () {
                          if (_formkey.currentState!.validate() &&
                              productImage != null) {
                            vm.uploadProductDetails(
                              productImage!,
                              context,
                              productName ?? "",
                              productDiscription ?? '',
                            );
                          }
                        },
                        child: (!vm.showLoading)
                            ? Text("Next")
                            : SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
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
  MDistributorDashboardNavigator getNavigator() {
    return this;
  }

  @override
  void loadPageData({value}) {
    // TODO: implement loadPageData
  }

  @override
  void navigateToVerifyUserFlow() {
    // TODO: implement navigateToVerifyUserFlow
  }

  @override
  Future<bool> provideOnWillPopScopeCallBack() {
    return Future.value(true);
  }

  @override
  Color? setBackgroundColor() {
    return null;
  }

  @override
  void showNoInternetPage() {
    // TODO: implement showNoInternetPage
  }
}
