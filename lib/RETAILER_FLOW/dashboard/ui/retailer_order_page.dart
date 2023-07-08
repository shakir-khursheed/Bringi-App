import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/viewmodel/retailer_dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../base/base_state.dart';
import '../../../common_resources/common_input_field.dart';

class RetailerHelp extends StatefulWidget {
  const RetailerHelp({super.key});

  @override
  State<RetailerHelp> createState() => _RetailerHelpState();
}

class _RetailerHelpState extends BaseState<
    RetailerHelp,
    RetailerDashboardViewModel,
    RetailerDashboardNavigator> implements RetailerDashboardNavigator {
  ScrollController? _scrollController;
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.filter_alt,
                  ),
                ),
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: true,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Help",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 0.0,
            elevation: 0.0,
            pinned: true,
            floating: false,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  onChanged: (text) {},
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search Help",
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: SizedBox(),
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
    // TODO: implement loadPageData
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
