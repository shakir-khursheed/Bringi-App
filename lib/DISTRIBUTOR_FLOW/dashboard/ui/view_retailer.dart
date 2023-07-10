import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';

class ViewRetailer extends StatefulWidget {
  const ViewRetailer({super.key});

  @override
  State<ViewRetailer> createState() => _ViewRetailerState();
}

class _ViewRetailerState extends BaseState<
    ViewRetailer,
    DistributorDashboardViewModel,
    DistributorDashboardNavigator> implements DistributorDashboardNavigator {
  ScrollController? _scrollController;
  @override
  AppBar? buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff051E43),
      // centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      automaticallyImplyLeading: false,
      title: Text(
        'Retailer List',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  @override
  Widget buildBody() {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    color: Colors.grey)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Areeb',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone_android,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('9149603319',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Badamwari Hawal Srinagar',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black))
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    color: Colors.grey)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Areeb',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone_android,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('9149603319',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Badamwari Hawal Srinagar',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black))
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
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

  @override
  DistributorDashboardNavigator getNavigator() {
    return this;
  }
}
