import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/ui/order_tracking_and_details/order_tracking_page.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../base/base_state.dart';

class RetailerHelpDetails extends StatefulWidget {
  final String orderId;
  const RetailerHelpDetails({
    super.key,
    required this.orderId,
  });

  @override
  State<RetailerHelpDetails> createState() => _RetailerHelpDetailsState();
}

class _RetailerHelpDetailsState extends BaseState<
    RetailerHelpDetails,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Help history",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  Widget buildLatestOrderStatusCard({
    required String status,
    required Color color,
    required Function onTap,
    required bool showloading,
    String? title,
    String? subtitle,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.grey.withOpacity(.6),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                title: Text(title ?? ""),
                subtitle: Text(subtitle ?? ""),
                trailing: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: color,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDeliveryDetailCard({
    required String customerName,
    required String customerMobileNo,
    required String customerAddress,
    required String customerPincode,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.grey.withOpacity(.6),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTileForDeliveryDetails(
            address: customerAddress,
            addressTitle: "Deliver To",
            name: customerName,
            mobileNo: "${customerMobileNo} | ${customerPincode}",
          )
        ],
      ),
    );
  }

  Widget buildOrderdetailCard(
      {required String orderId,
      required String createdOn,
      required String totalAmount,
      required String paymentType,
      required String productQuantity}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.grey.withOpacity(.6),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Order Details",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            keyvalueItemsForPackageDetails(
              key: "Order ID",
              value: orderId,
            ),
            const SizedBox(
              height: 15,
            ),
            keyvalueItemsForPackageDetails(
              key: "Created On",
              value: createdOn,
            ),
            const SizedBox(
              height: 15,
            ),
            keyvalueItemsForPackageDetails(
              key: "Order Amount",
              value: totalAmount,
            ),
            const SizedBox(
              height: 15,
            ),
            keyvalueItemsForPackageDetails(
              key: "Payment Type",
              value: paymentType,
            ),
            const SizedBox(
              height: 15,
            ),
            keyvalueItemsForPackageDetails(
              key: "Product quantity",
              value: productQuantity,
            ),
          ],
        ),
      ),
    );
  }

  Widget keyvalueItemsForPackageDetails({String? key, String? value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          RichText(
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.2,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$key :",
                  style: TextStyle(
                      color: HexColor.fromHex("#000000").withOpacity(.5),
                      fontSize:
                          (MediaQuery.of(context).size.height > 782) ? 12 : 10),
                ),
                TextSpan(
                  text: "   $value",
                  style: TextStyle(
                    color: HexColor.fromHex("#000000").withOpacity(.7),
                    fontWeight: FontWeight.w500,
                    fontSize:
                        (MediaQuery.of(context).size.height > 782) ? 12 : 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: viewModel.getOrderDetails(widget.orderId),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  buildLatestOrderStatusCard(
                    status: snapshot.data?.docs[index].get("orderStatus"),
                    color: HexColor.fromHex("F2C357"),
                    onTap: () {
                      push(widget: HelpTrackingPage());
                    },
                    showloading: false,
                    title: snapshot.data?.docs[index].get("orderId"),
                    subtitle: "OrderHistory",
                  ),
                  Gap(10),
                  buildOrderdetailCard(
                      orderId: "${widget.orderId}",
                      createdOn:
                          "${snapshot.data?.docs[index].get("createdAt")}",
                      totalAmount:
                          "₹ ${snapshot.data?.docs[index].get("orderAmount")}",
                      paymentType:
                          "${snapshot.data?.docs[index].get("orderType")}",
                      productQuantity:
                          "${snapshot.data?.docs[index].get("productQuantity")}"),
                  Gap(10),
                  buildDeliveryDetailCard(
                    customerName:
                        "${snapshot.data?.docs[index].get("RetailerName")}",
                    customerMobileNo:
                        "${snapshot.data?.docs[index].get("RetailerMobileNo")}",
                    customerAddress:
                        "${snapshot.data?.docs[index].get("deliveryAddress")}",
                    customerPincode: "",
                  )
                ],
              );
            },
          );
        },
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
  void loadPageData({value}) async {}

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

  void onRefresh() {}
}

class ListTileForDeliveryDetails extends StatelessWidget {
  final String addressTitle;
  final String name;
  final String address;
  final String mobileNo;
  const ListTileForDeliveryDetails({
    required this.address,
    required this.addressTitle,
    required this.name,
    required this.mobileNo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  margin: const EdgeInsets.all(20),
                  waitDuration: const Duration(
                    seconds: 1,
                  ),
                  message: name,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: HexColor.fromHex("#000000").withOpacity(.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  margin: const EdgeInsets.all(20),
                  waitDuration: const Duration(
                    seconds: 1,
                  ),
                  message: address,
                  child: Text(
                    address,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: HexColor.fromHex("#000000").withOpacity(.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  margin: const EdgeInsets.all(20),
                  waitDuration: const Duration(
                    seconds: 1,
                  ),
                  message: mobileNo,
                  child: Text(
                    mobileNo,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: HexColor.fromHex("#000000").withOpacity(.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
