import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';

class AssignHelp extends StatefulWidget {
  const AssignHelp({super.key});

  @override
  State<AssignHelp> createState() => _AssignHelpState();
}

class _AssignHelpState extends BaseState<
    AssignHelp,
    DistributorDashboardViewModel,
    DistributorDashboardNavigator> implements DistributorDashboardNavigator {
  @override
  AppBar? buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff051E43),
      centerTitle: true,
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
        'Assign Help',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  @override
  Widget buildBody() {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: ExpansionTile(
            title: Text(
              "OrderID: #137837378373873",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            subtitle: Text('Ordered Now',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xff48742C),
                    fontWeight: FontWeight.bold)),
            iconColor: Colors.black,
            collapsedIconColor: Colors.green,
            children: [
              ListTile(
                title: Text(
                  "PREMIUM PACK (2L)",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                trailing: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Icon(
                        Icons.currency_rupee,
                        color: Color(0xff4872A4),
                        size: 20,
                      ),
                    ),
                    Text('2000',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff4872A4),
                        )),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Agent name',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('9149603319',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ],
                ),
                trailing: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffF2C357)),
                        onPressed: () {},
                        child: Text(
                          "Assign Help",
                          style: TextStyle(color: Colors.black),
                        ))),
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
