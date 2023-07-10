import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';
import 'invoice.dart';

class HelpHistoryDistributor extends StatefulWidget {
  const HelpHistoryDistributor({super.key});

  @override
  State<HelpHistoryDistributor> createState() => _HelpHistoryDistributorState();
}

class _HelpHistoryDistributorState extends BaseState<
    HelpHistoryDistributor,
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
        'Help History',
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
          height: MediaQuery.of(context).size.height * 0.10,
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
                          fontSize: 18,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w700)),
                  Spacer(),
                  Text('Delivered',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color(0xff48742C),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text("#627867623786235"),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Product details',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Product Name:',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('PREMIUM PACK (2L)',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff999999),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Order Amount:',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('2000',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff999999),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Created on:',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('12/03/2023',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff999999),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Order quality:',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff051E43),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text('12 packs',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w500)),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Delivery details',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Retailer Name:',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Areeb Mushtaq  Malik',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff999999),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Phone no:',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('9239903930',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff999999),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Address:',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff051E43),
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Badamwari Hawal',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff999999),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Pincode:',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Color(0xff051E43),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text('190002',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w500)),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color(0xffF2C357)),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => InvoiceView())));
        },
        child: Text(
          'View Invoice',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
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
