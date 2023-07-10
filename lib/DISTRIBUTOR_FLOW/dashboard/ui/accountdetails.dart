import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/distributor_dashboard_navigator.dart';
import '../viewmodel/distributor_dashboard_viewmodel.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends BaseState<
    AccountDetails,
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
        'Account Settings',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Icon(Icons.edit),
        )
      ],
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.account_circle,
              size: 120,
              color: Color.fromARGB(255, 12, 13, 94),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  'Areeb Enterprises',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Icon(
                  Icons.verified,
                  color: Color(0xff48742C),
                ),
                const Spacer()
              ],
            ),
            Text(
              'Indo Kashmir Carpet, Zaidagar\nSrinagar....',
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEFEDED),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Text(
                  'Address',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.description),
                const Gap(10),
                Text(
                  'Saved address',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.add_circle),
                const Gap(10),
                Text(
                  'Add address',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEFEDED),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Text(
                  'Info',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.description),
                const Gap(10),
                Text(
                  'Terms \$ Conditions',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.help),
                const Gap(10),
                Text(
                  'Help \$ Support',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.error),
                const Gap(10),
                Text(
                  'FAQ',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.info),
                const Gap(10),
                Text(
                  'Loyalty rewards',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEFEDED),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                child: Text(
                  'Settings',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Row(
              children: [
                const Gap(10),
                const Icon(Icons.keyboard),
                const Gap(10),
                Text(
                  'Change Password',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                            title: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.logout,
                                  color: Color(0xffD67676),
                                  size: 100,
                                ),
                                Text(
                                  'Are you sure you want to logout',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 45,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        'Yes',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 45,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        'No',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ))));
              },
              child: Row(
                children: [
                  const Gap(10),
                  const Icon(
                    Icons.logout,
                    color: Color(0xffD67676),
                  ),
                  const Gap(10),
                  Text(
                    'Log out',
                    style: GoogleFonts.poppins(color: Color(0xffD67676)),
                  ),
                ],
              ),
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
