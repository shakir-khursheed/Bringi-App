import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/navigator/M-distributor_dashboard_navigator.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/viewmodel/M-distributor_dashboard_viewmodel.dart';
import 'package:bringi_app/common_resources/common_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../base/base_state.dart';

class Manageproducts extends StatefulWidget {
  const Manageproducts({Key? key}) : super(key: key);

  @override
  State<Manageproducts> createState() => _ManageproductsState();
}

class _ManageproductsState extends BaseState<
    Manageproducts,
    MDistributorDashboardViewModel,
    MDistributorDashboardNavigator> implements MDistributorDashboardNavigator {
  final MDistributorDashboardViewModel viewproducts =
      MDistributorDashboardViewModel();

  @override
  void initState() {
    super.initState();
    viewproducts.adminproducts();
  }

  @override
  AppBar? buildAppBar() {
    return commonAppbarForScreens(
      title: "Manage products",
      onTap: () {
        pop();
      },
      centerTitle: true,
    );
  }

  @override
  Widget buildBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Admin Products"),
              Spacer(),
              Text("Select All"),
              Checkbox(
                value: true,
                onChanged: (newValue) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: viewproducts.adminproducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QueryDocumentSnapshot> products = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot order = products[index];
                    String imageUrl = order['imageUrl'];
                    String productname = order['productName'];
                    String mrpf12Pack = order['mrpf12Pack'];
                    String productDiscription = order['productDiscription'];

                    return Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 1.3,
                      ),
                      padding: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                imageUrl,
                                height: 100,
                                width: 100,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productname,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "₹  ${mrpf12Pack}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff051E43),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: productDiscription
                                          .split('\n')
                                          .map(
                                            (point) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('•',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                  SizedBox(width: 8),
                                                  Expanded(child: Text(point)),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
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
