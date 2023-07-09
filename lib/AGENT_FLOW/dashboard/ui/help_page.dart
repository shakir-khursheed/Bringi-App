import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/agent_dashboard_navigator.dart';
import '../viewmodel/agent_dashboard_viewmodel.dart';
import 'help_details_page.dart';
import 'notification_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends BaseState<HelpScreen, AgentDashboardViewModel,
    AgentDashboardNavigator> implements AgentDashboardNavigator {
  ScrollController? _scrollController;
  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff051E43),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 70, 0, 0),
            child: Text(
              'My Help',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Id: #18388388383838',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                      Text('30-05-2023',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black54))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery location:',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black54)),
                      Text('Indo kashmir Carpet, Zaidagar\nSrinagar_',
                          style: GoogleFonts.poppins(fontSize: 13))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery time:',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black54)),
                      Text('April 3, 11.00 am',
                          style: GoogleFonts.poppins(fontSize: 13))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pickup Location:',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black54)),
                      Text('Lal chowk, Srinagar',
                          style: GoogleFonts.poppins(fontSize: 13))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xff80EB76)),
                        child: Text(
                          'Accept',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xffD67676)),
                        child: Text(
                          'Reject',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const HelpDetails())));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 100,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color(0xffEFE5E5)),
                          child: Text(
                            'Details',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }

  @override
  Widget? buildBottomNavbar() {
    return null;
  }

  @override
  Widget? buildFloatingActionButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Color(0xff051E43),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const Notifications())));
      },
      child: const Icon(
        Icons.forum,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  @override
  Drawer? buildScreenDrawer() {
    return null;
  }

  @override
  AgentDashboardNavigator getNavigator() {
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
