import 'package:bringi_app/AGENT_FLOW/dashboard/ui/order_status.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/agent_dashboard_navigator.dart';
import '../viewmodel/agent_dashboard_viewmodel.dart';

class HelpDetails extends StatefulWidget {
  const HelpDetails({super.key});

  @override
  State<HelpDetails> createState() => _HelpDetailsState();
}

class _HelpDetailsState extends BaseState<HelpDetails, AgentDashboardViewModel,
    AgentDashboardNavigator> implements AgentDashboardNavigator {
  ScrollController? _scrollController;
  @override
  AppBar? buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff051E43),
      title: Text(
        'Help Details',
        style: GoogleFonts.poppins(),
      ),
      // centerTitle: true,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Color.fromARGB(255, 12, 13, 94),
                ),
                const Gap(10),
                Text(
                  'Areeb  Malik',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.black54,
                  size: 20,
                ),
                const Gap(20),
                Text(
                  '9906612342',
                  style:
                      GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.black54,
                  size: 20,
                ),
                const Gap(20),
                Text(
                  'areebmalik@gmail.com',
                  style:
                      GoogleFonts.poppins(color: Colors.black54, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 198, 197, 197)),
                  child: const Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 12, 13, 94),
                  ),
                ),
                const Gap(40),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 198, 197, 197)),
                  child: const Icon(
                    Icons.message,
                    color: Color.fromARGB(255, 12, 13, 94),
                  ),
                ),
                const Gap(40),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 198, 197, 197)),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color.fromARGB(255, 12, 13, 94),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
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
                const Gap(30),
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
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Text(
              'Pickup Information:',
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black45),
            ),
            Text('Abc store', style: GoogleFonts.poppins()),
            Text('990552054', style: GoogleFonts.poppins()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('abc@gmail.com', style: GoogleFonts.poppins()),
                Text('Map', style: GoogleFonts.poppins())
              ],
            ),
            Text('Lal Chowk, Srinagar', style: GoogleFonts.poppins()),
            Text('Delivery information: ',
                style:
                    GoogleFonts.poppins(fontSize: 13, color: Colors.black45)),
            Text('Areeb Malik', style: GoogleFonts.poppins()),
            Text('9908802342', style: GoogleFonts.poppins()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('abc@gmail.com', style: GoogleFonts.poppins()),
                Text('Map', style: GoogleFonts.poppins())
              ],
            ),
            Text('Indo kashmiri Carpet, Zaidagar Srinagar_',
                style: GoogleFonts.poppins()),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => OrderStatus())));
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffCAA08E),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Start Navigating',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Text(
              'Items',
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black45),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/bringi.png',
                  height: 90,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PREMIUM PACK (1 LITRES)',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                    Text('12 packs',
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: Colors.black45)),
                    Text('Extraction from undergroung spring',
                        style: GoogleFonts.poppins(fontSize: 13)),
                    Text('Total', style: GoogleFonts.poppins()),
                    Text('2098',
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: Colors.black45))
                  ],
                )
              ],
            )
          ],
        ),
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
