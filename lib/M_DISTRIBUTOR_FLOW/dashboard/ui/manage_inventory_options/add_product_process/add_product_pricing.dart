import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/navigator/M-distributor_dashboard_navigator.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/common_dropdown_field.dart';

import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../base/base_state.dart';

class AddProductPricingAndQuantity extends StatefulWidget {
  final String? productName;
  final String? productDiscription;
  final String? ImageUrl;
  const AddProductPricingAndQuantity({
    super.key,
    this.ImageUrl,
    this.productName,
    this.productDiscription,
  });

  @override
  State<AddProductPricingAndQuantity> createState() =>
      _AddProductPricingAndQuantityState();
}

class _AddProductPricingAndQuantityState extends BaseState<
    AddProductPricingAndQuantity,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  final ProductQuantityList = [
    "Pack of 12",
    "Pack of 24",
    "Pack of 60",
    "Pack of 120",
    "All"
  ];
  String? productQuantity;
  String? pack12Price;
  String? pack24Price;
  String? pack60Price;
  String? pack120Price;
  String? marginForPackof12;
  String? marginForPackof24;
  String? marginForPackof60;
  String? marginForPackof120;
  String? mrpofPackof12;
  String? mrpofPackof24;
  String? mrpofPackof60;
  String? mrpofPackof120;
  String? inStock;
  String? gst;
  String? hns;
  final _formkey = GlobalKey<FormState>();
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
      child: Consumer<MDistributorDashboardViewModel>(
        builder: (context, vm, child) => Form(
          key: _formkey,
          child: ListWithFixedButtonAtBottom(
            children: [
              Text(
                "Product quantity and pricing",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              CommonInputField(
                onTextChange: (value) {
                  inStock = value;
                },
                labelText: "InStock",
                textInputType: TextInputType.number,
                fieldValidator: (value) {
                  if (value.toString().isEmpty) {
                    return "InStock field cannot be empty";
                  }
                },
                maxlength: 100,
                isAutovalidateModeon: false,
              ),
              Gap(10),
              SimpleDropdownInputField(
                dropdownlabel: "Select product quantity",
                dropdownListItem: ProductQuantityList,
                onValueSelected: (value) {
                  productQuantity = value;
                  switch (value) {
                    case "All":
                      {
                        vm.setpackof12Available = false;
                        vm.setpackof24Available = false;
                        vm.setpackof60Available = false;
                        vm.setpackof120Available = false;
                        vm.setAllProductsAvailable = true;
                        break;
                      }
                    case "Pack of 12":
                      {
                        vm.setpackof12Available = true;
                        vm.setpackof24Available = false;
                        vm.setpackof60Available = false;
                        vm.setpackof120Available = false;
                        vm.setAllProductsAvailable = false;
                        break;
                      }
                    case "Pack of 24":
                      {
                        vm.setpackof12Available = false;
                        vm.setpackof24Available = true;
                        vm.setpackof60Available = false;
                        vm.setpackof120Available = false;
                        vm.setAllProductsAvailable = false;
                        break;
                      }
                    case "Pack of 60":
                      {
                        vm.setpackof12Available = false;
                        vm.setpackof24Available = false;
                        vm.setpackof60Available = true;
                        vm.setpackof120Available = false;
                        vm.setAllProductsAvailable = false;
                        break;
                      }
                    case "Pack of 120":
                      {
                        vm.setpackof12Available = false;
                        vm.setpackof24Available = false;
                        vm.setpackof60Available = false;
                        vm.setpackof120Available = true;
                        vm.setAllProductsAvailable = false;
                        break;
                      }
                  }
                },
              ),
              Gap(20),
              Text(
                "Product pricing",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(20),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof12Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 12 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          pack12Price = value;
                        },
                        labelText: "Price",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid price";
                          }
                          if (value.toString().isEmpty) {
                            return "Price field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    )
                  ],
                ),
              ),
              Gap(10),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof24Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 24 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          pack24Price = value;
                        },
                        labelText: "Price",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "Price field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    )
                  ],
                ),
              ),
              Gap(10),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof60Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 60 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          pack60Price = value;
                        },
                        labelText: "Price",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "Price field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    )
                  ],
                ),
              ),
              Gap(10),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof120Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 120 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          pack120Price = value;
                        },
                        labelText: "Price",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "Price field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    )
                  ],
                ),
              ),
              Gap(20),
              Text(
                "Margin & MRP",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(20),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof12Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 12 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          marginForPackof12 = value;
                        },
                        labelText: "Margin",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 2) {
                            return "Please enter valid pack margin";
                          }
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          mrpofPackof12 = value;
                        },
                        labelText: "MRP",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "mrp field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof24Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 24 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          marginForPackof24 = value;
                        },
                        labelText: "Margin",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 2) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          mrpofPackof24 = value;
                        },
                        labelText: "MRP",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    )
                  ],
                ),
              ),
              Gap(10),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof60Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 60 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          marginForPackof60 = value;
                        },
                        labelText: "Margin",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 2) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          mrpofPackof60 = value;
                        },
                        labelText: "MRP",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isNotEmpty &&
                              value.toString().length < 3) {
                            return "Please enter valid pack price";
                          }
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    )
                  ],
                ),
              ),
              Gap(10),
              Visibility(
                visible:
                    (vm.AreAllProductsAvailable || vm.Arepackof120Available),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pack of 120 :",
                      ),
                    ),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          marginForPackof120 = value;
                        },
                        labelText: "Margin",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: CommonInputField(
                        onTextChange: (value) {
                          mrpofPackof120 = value;
                        },
                        labelText: "MRP",
                        textInputType: TextInputType.number,
                        fieldValidator: (value) {
                          if (value.toString().isEmpty) {
                            return "margin field cannot be empty";
                          }
                        },
                        maxlength: 100,
                        isAutovalidateModeon: false,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "GST & HSN",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              CommonInputField(
                onTextChange: (value) {
                  gst = value;
                },
                labelText: "gst",
                textInputType: TextInputType.number,
                fieldValidator: (value) {
                  if (value.toString().isEmpty) {
                    return "Gst field cannot be empty";
                  }
                },
                maxlength: 100,
                isAutovalidateModeon: false,
              ),
              Gap(10),
              CommonInputField(
                onTextChange: (value) {
                  hns = value;
                },
                labelText: "HSN",
                textInputType: TextInputType.text,
                fieldValidator: (value) {
                  if (value.toString().isEmpty) {
                    return "Hsn field cannot be empty";
                  }
                },
                maxlength: 100,
                isAutovalidateModeon: false,
              ),
              Gap(30),
            ],
            fixedAtBottomChild: [
              Consumer<MDistributorDashboardViewModel>(
                builder: (context, vm, child) => Expanded(
                  child: (!vm.showLoading)
                      ? MaterialButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          color: HexColor.fromHex("EBC351"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              vm.AddProduct(
                                context,
                                productName: widget.productName,
                                productDiscription: widget.productDiscription,
                                productQuantity: productQuantity,
                                inStock: inStock,
                                pack12Price: pack12Price,
                                pack24Price: pack24Price,
                                pack60Price: pack60Price,
                                pack120Price: pack120Price,
                                marginForPackof12: marginForPackof12,
                                marginForPackof24: marginForPackof24,
                                marginForPackof60: marginForPackof60,
                                marginForPackof120: marginForPackof120,
                                mrpofPackof12: mrpofPackof12,
                                mrpofPackof24: mrpofPackof24,
                                mrpofPackof60: mrpofPackof60,
                                mrpofPackof120: mrpofPackof120,
                                gst: gst,
                                hns: hns,
                              );
                            }
                          },
                          child: Text("Add product"),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                ),
              ),
            ],
          ),
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
