import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/agent_dashboard_navigator.dart';
import '../viewmodel/agent_dashboard_viewmodel.dart';

class OrderInvoice extends StatefulWidget {
  const OrderInvoice({super.key});

  @override
  State<OrderInvoice> createState() => _OrderInvoiceState();
}

class _OrderInvoiceState extends BaseState<
    OrderInvoice,
    AgentDashboardViewModel,
    AgentDashboardNavigator> implements AgentDashboardNavigator {
  ScrollController? _scrollController;
  @override
  AppBar? buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff051E43),
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
        'Invoice',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  @override
  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/bringi.png',
                height: 50,
              ),
              Text(
                'Invoice',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
          const Gap(15),
          Text(
            'Billing Details',
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          Text(
            'Areeb Malik',
            style: GoogleFonts.poppins(),
          ),
          Text(
            'Badamwari Hawai Srinagar 190003',
            style: GoogleFonts.poppins(),
          ),
          Text(
            '9148503119',
            style: GoogleFonts.poppins(),
          ),
          const Gap(30),
          SizedBox(
            // color: Color(0xffF2C357),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Table(
              border: TableBorder.all(color: Colors.black54),
              columnWidths: const {
                0: FlexColumnWidth(2), // Width ratio for column 0
                1: FlexColumnWidth(1), // Width ratio for column 2
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.black12,
                        height: 50,
                        child: Text('    Description',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black12,
                        height: 50,
                        child: Text('Amount',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
                TableRow(children: [
                  TableCell(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Text('   Order Amount',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      // const Gap(20),
                      Text('   GST',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      // const Gap(20),
                      Text('   Coupon Applied',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      // const Gap(20),
                      Text('   Discount',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                      const Gap(40),
                    ],
                  )),
                  TableCell(
                      child: Column(
                    children: [
                      const Gap(20),
                      Text('3000', style: GoogleFonts.poppins()),
                      // const Gap(20),
                      Text('15%', style: GoogleFonts.poppins()),
                      // const Gap(20),
                      Text('-600', style: GoogleFonts.poppins()),
                      // const Gap(20),
                      Text('-400', style: GoogleFonts.poppins()),
                      // const Gap(20),
                    ],
                  ))
                ]),
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.black12,
                        height: 50,
                        child: Text(
                          '    Total',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black12,
                        height: 50,
                        child: Text(
                          '2000',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          // const Gap(20),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 246, 205, 103),
            child: Text(
              'Download as PDF',
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
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
