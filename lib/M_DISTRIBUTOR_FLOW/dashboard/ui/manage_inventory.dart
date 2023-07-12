import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/navigator/M-distributor_dashboard_navigator.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/manage_inventory_options/add_product_process/add_product_details.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/manage_inventory_options/manage_product.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:bringi_app/common_resources/no_item_found.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../base/base_state.dart';

class ManageInventory extends StatefulWidget {
  const ManageInventory({super.key});

  @override
  State<ManageInventory> createState() => _ManageInventoryState();
}

class _ManageInventoryState extends BaseState<
    ManageInventory,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Manage Inventory",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          helpListCard(
            Hexcolor: "4872A4",
            count: Icon(
              Icons.inventory,
              color: Colors.white,
            ),
            label: "Add Products",
            onTap: () {
              push(
                widget: Addproducts(),
              );
            },
          ),
          Gap(10),
          helpListCard(
            Hexcolor: "4872A4",
            count: Icon(
              Icons.inventory,
              color: Colors.white,
            ),
            label: "Manage Products",
            onTap: () {
              push(
                widget: Manageproducts(),
              );
            },
          ),
          Gap(20),
          Text(
            "Products",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(20),
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
                        onTap: () {},
                        child: ProductItem(
                          snapshot,
                          index,
                          () {},
                        ),
                      ),
                    );
                  })),
        ],
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

  Widget helpListCard(
      {String? Hexcolor, Widget? count, String? label, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Card(
        color: HexColor.fromHex("$Hexcolor"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: ListTile(
          leading: count,
          title: Text(
            "$label",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
