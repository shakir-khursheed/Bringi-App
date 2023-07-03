import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:flutter/material.dart';
import '../../../base/base_state.dart';
import '../navigator/agent_dashboard_navigator.dart';
import '../viewmodel/agent_dashboard_viewmodel.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends BaseState<
    AgentDashboard,
    AgentDashboardViewModel,
    AgentDashboardNavigator> implements AgentDashboardNavigator {
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
            centerTitle: true,
            titleSpacing: 0.0,
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.card_travel,
                      ),
                      Text("Smart\nsupply")
                    ],
                  ),
                ),
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: true,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Text(
              "Areeb Enterprisis",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 0.0,
            actions: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.mic,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.notifications,
              ),
              SizedBox(
                width: 10,
              ),
            ],
            elevation: 0.0,
            pinned: true,
            floating: false,
            backgroundColor: HexColor.fromHex("051E43"),
            title: Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: SizedBox(
                height: 45,
                child: CommonInputField(
                  onTextChange: (text) {},
                  labelText: "Search products",
                  textInputType: TextInputType.text,
                  fieldValidator: (value) {},
                  maxlength: 30,
                  isAutovalidateModeon: false,
                ),
              ),
            ),
          )
        ];
      },
      body: Container(
        child: Center(
          child: Text(
            "DASHBOARD",
          ),
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
  void loadPageData({value}) {
    // TODO: implement loadPageData
  }

  @override
  void navigateToVerifyUserFlow() {
    // TODO: implement navigateToVerifyUserFlow
  }

  @override
  Future<bool> provideOnWillPopScopeCallBack() {
    return Future.value(false);
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
  AgentDashboardNavigator getNavigator() {
    return this;
  }
}
