import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../../../common_resources/common_input_field.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';
import 'help_history.dart';
import 'notification_view.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends BaseState<HelpView, DistributorDashboardViewModel,
    DistributorDashboardNavigator> implements DistributorDashboardNavigator {
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const NotificationView())));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.filter_list_outlined,
                  ),
                ),
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: true,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
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
            titleSpacing: 0.0,
            elevation: 0.0,
            pinned: true,
            floating: true,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                height: 45,
                child: CommonInputField(
                  prefixIcon: Icon(Icons.search),
                  onTextChange: (text) {},
                  labelText: "Search Help",
                  textInputType: TextInputType.text,
                  fieldValidator: (value) {},
                  maxlength: 30,
                  isAutovalidateModeon: false,
                ),
              ),
            ),
          ),
        ];
      },
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const HelpHistoryDistributor())));
            },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Order ID',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Color(0xff051E43),
                              fontWeight: FontWeight.w700)),
                      Spacer(),
                      SizedBox(
                        height: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff48742C).withOpacity(0.3)),
                            onPressed: () {},
                            child: Text('Delivered',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Color(0xff48742C),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("#627867623786235"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        color: Color(0xff4872A4),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('2000',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xff4872A4),
                          )),
                      Spacer(),
                      Text('Created on',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Premium Pack (2L)',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff4872A4),
                          )),
                      Spacer(),
                      Text('13/02/2023',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff4872A4),
                          )),
                    ],
                  ),
                ],
              ),
            ),
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
