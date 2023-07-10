import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';

class AddAgents extends StatefulWidget {
  const AddAgents({super.key});

  @override
  State<AddAgents> createState() => _AddAgentsState();
}

class _AddAgentsState extends BaseState<
    AddAgents,
    DistributorDashboardViewModel,
    DistributorDashboardNavigator> implements DistributorDashboardNavigator {
  ScrollController? _scrollController;
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
        'Add Agents',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  @override
  Widget buildBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.28,
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: HexColor.fromHex("051E43"),
                        child: Icon(
                          Icons.account_circle_sharp,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('KYC STATUS',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: HexColor.fromHex("051E43"),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Verified",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xff48742C),
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Agent name',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: HexColor.fromHex("051E43"),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("9149603319"),
                      Spacer(),
                      SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffF2C357)),
                              onPressed: () {},
                              child: Text("Approve"))),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffEB3223)),
                              onPressed: () {},
                              child: Text("Reject")))
                    ],
                  ),
                ],
              ),
            ),
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
  DistributorDashboardNavigator getNavigator() {
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
