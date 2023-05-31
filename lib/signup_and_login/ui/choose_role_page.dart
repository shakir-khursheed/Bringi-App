import 'package:bringi_app/constants/role_identifier.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow/user_resgistration_flow.dart';
import 'package:flutter/material.dart';
import '../../base/base_state.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: HexColor.fromHex("#051E43"),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 200,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text("Select Role"),
        ),
        body: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            selectRoleOption(
              onOptionselected: () {
                navigateToUserRegistrationFlow(
                  RoleIdentifier.RETAILER,
                );
              },
              label: "Retailer",
            ),
            selectRoleOption(
              optionColor: Colors.green,
              onOptionselected: () {
                navigateToUserRegistrationFlow(
                  RoleIdentifier.DISTRIBUTOR,
                );
              },
              label: "Distributor",
            ),
            selectRoleOption(
              optionColor: Colors.yellow,
              onOptionselected: () {
                navigateToUserRegistrationFlow(
                  RoleIdentifier.MASTERDISTRIBUTOR,
                );
              },
              label: "M - Distributor",
            ),
            selectRoleOption(
              optionColor: Colors.cyan,
              onOptionselected: () {
                navigateToUserRegistrationFlow(
                  RoleIdentifier.AGENT,
                );
              },
              label: "Agent",
            ),
          ],
        ),
      ),
    );
  }

  Widget selectRoleOption({
    required Function onOptionselected,
    required String label,
    Color? optionColor,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          alignment: AlignmentDirectional.center,
          iconSize: 60.0,
          onPressed: () {
            onOptionselected();
          },
          icon: Icon(
            Icons.account_circle,
            color: optionColor ?? Colors.white,
          ),
        ),
        Text(
          "$label",
          style: TextStyle(
            color: optionColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  navigateToUserRegistrationFlow(RoleIdentifier roleIdentifier) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              UserRegistrationFlow(roleIdentifier: roleIdentifier),
        ),
        (route) => false);
  }
}
