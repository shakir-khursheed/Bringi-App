import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/base_state.dart';
import '../navigator/agent_dashboard_navigator.dart';
import '../viewmodel/agent_dashboard_viewmodel.dart';
import 'invoice_details.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends BaseState<OrderStatus, AgentDashboardViewModel,
    AgentDashboardNavigator> implements AgentDashboardNavigator {

  @override
  AppBar? buildAppBar() {
    return null;
  }

  @override
  Widget buildBody() {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/map.png'),
          SingleChildScrollView(
            child: ExpansionTile(
              title: Column(
                children: [
                  Container(
                    height: 6,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Color.fromARGB(255, 12, 13, 94),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Abc',
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                          Text(
                            '15 MINS AWAY',
                            style:
                                GoogleFonts.poppins(color: Color(0xffD67676)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              children: <Widget>[
                Column(
                  children: [
                    const Gap(10),
                    Row(
                      children: [
                        const Gap(20),
                        const Icon(
                          Icons.directions_car,
                          color: Color(0xffD67676),
                        ),
                        const Gap(10),
                        Text(
                          'Alto 2008',
                          style: GoogleFonts.poppins(),
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Gap(20),
                        const Icon(
                          Icons.location_on,
                          color: Color(0xffD67676),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery To',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              'Indo kashmiri Carpet, Zaidagar\n Srinagar',
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.black38),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Gap(20),
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xffD67676),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Delivered',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              'your order has been delivered',
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.black38),
                            ),
                            const Gap(6),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Gap(20),
                        const Icon(
                          Icons.cancel,
                          color: Color(0xffD67676),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'On the way to dropoff location',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              'Rider is going to dropoff location',
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.black38),
                            ),
                            const Gap(6),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Gap(20),
                        const Icon(
                          Icons.cancel,
                          color: Color(0xffD67676),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Picked',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              'Your order has been picked up',
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.black38),
                            ),
                            const Gap(6),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Gap(20),
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xffD67676),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'On the way to dropoff location',
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              'rider is going to pickup your order',
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: Colors.black38),
                            ),
                            const Gap(6),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => OrderInvoice())));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff051E43)),
                              child: Text(
                                'Submit',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                  ],
                )
              ],
            ),
          ),
          // const Gap(10),
          // ExpansionTile(
          //   title: Column(
          //     children: [
          //       Row(
          //         children: [
          //           const Icon(
          //             Icons.account_circle,
          //             size: 50,
          //             color: Color.fromARGB(255, 12, 13, 94),
          //           ),
          //           const Gap(10),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'Abc',
          //                 style: GoogleFonts.poppins(color: Colors.black),
          //               ),
          //               Text(
          //                 '15 MINS AWAY',
          //                 style: GoogleFonts.poppins(color: Color(0xffD67676)),
          //               )
          //             ],
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          //   children: [
          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             const Icon(
          //               Icons.directions_car,
          //               color: Color(0xffD67676),
          //             ),
          //             Text(
          //               'Alto 2008',
          //               style: GoogleFonts.poppins(),
          //             )
          //           ],
          //         )
          //       ],
          //     )
          //   ],
          // )
          // InkWell(
          //   onTap: () {
          //     showModalBottomSheet<void>(
          //       // context and builder are
          //       // required properties in this widget
          //       context: context,
          //       builder: (BuildContext context) {
          //         // we set up a container inside which
          //         // we create center column and display text

          //         // Returning SizedBox instead of a Container
          //         return ExpansionTile(
          //             title: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 const Icon(
          //                   Icons.account_circle,
          //                   size: 50,
          //                   color: Color.fromARGB(255, 12, 13, 94),
          //                 ),
          //                 const Gap(10),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Abc',
          //                       style: GoogleFonts.poppins(),
          //                     ),
          //                     Text(
          //                       '15 MINS AWAY',
          //                       style: GoogleFonts.poppins(color: Color(0xffD67676)),
          //                     )
          //                   ],
          //                 )
          //               ],
          //             )
          //           ],
          //         ));
          //       },
          //     );
          //   },
          //   child: Container(
          //     height: 10,
          //     width: MediaQuery.of(context).size.width * 0.25,
          //     decoration: BoxDecoration(
          //         color: Colors.black26, borderRadius: BorderRadius.circular(10)),
          //   ),
          // )
          //  Text('showModalBottomSheet'),
          // onPressed: () {
          //   // when raised button is pressed
          //   // we display showModalBottomSheet
          //   showModalBottomSheet<void>(
          //     // context and builder are
          //     // required properties in this widget
          //     context: context,
          //     builder: (BuildContext context) {
          //       // we set up a container inside which
          //       // we create center column and display text

          //       // Returning SizedBox instead of a Container
          //       return ExpansionTile(
          //           title: Column(
          //         children: [
          //           Row(
          //             children: [
          //               const Icon(
          //                 Icons.account_circle,
          //                 size: 50,
          //                 color: Color.fromARGB(255, 12, 13, 94),
          //               ),
          //               const Gap(10),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     'Abc',
          //                     style: GoogleFonts.poppins(),
          //                   ),
          //                   Text(
          //                     '15 MINS AWAY',
          //                     style:
          //                         GoogleFonts.poppins(color: Color(0xffD67676)),
          //                   )
          //                 ],
          //               )
          //             ],
          //           )
          //         ],
          //       ));
          //     },
          //   );
          // }
        ],
      ),
    ));
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
