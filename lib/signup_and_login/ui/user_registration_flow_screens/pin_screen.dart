import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/common_resources/pin_input_field.dart';
import 'package:bringi_app/constants/role_identifier.dart';
import 'package:flutter/material.dart';
import '../../../common_resources/get_asset_image.dart';

class PinScreen extends StatefulWidget {
  final Function onPinsubmitted;
  final Function onResendCodeClicked;
  final RoleIdentifier roleIdentifier;
  final String? mobileNo;
  const PinScreen(
      {super.key,
      required this.onPinsubmitted,
      required this.onResendCodeClicked,
      required this.roleIdentifier,
      this.mobileNo});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final _formKey = GlobalKey<FormState>();
  String? code;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: ListWithFixedButtonAtBottom(
          children: [
            Center(
              child: getAssetImage(
                "splash_logo.png",
                height: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              (widget.roleIdentifier == RoleIdentifier.MASTERDISTRIBUTOR ||
                      widget.roleIdentifier == RoleIdentifier.AGENT)
                  ? "Verify Code send on ${widget.mobileNo}"
                  : "Verify Code send by ${(widget.roleIdentifier == RoleIdentifier.RETAILER) ? "distributor" : "Master distributor"}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter code",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SecurityPinInputField(
              onPinCompleted: (value) {
                code = value;
                widget.onPinsubmitted();
              },
              fieldvalidator: (value) {
                if (value.toString().length < 6 &&
                    value.toString().isNotEmpty) {
                  return "Code should be 6 digits";
                }
                if (value.toString().isEmpty) {
                  return "Code cannot be empty";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: (widget.roleIdentifier == RoleIdentifier.RETAILER ||
                      widget.roleIdentifier == RoleIdentifier.DISTRIBUTOR)
                  ? false
                  : true,
              child: TextButton(
                onPressed: () {
                  widget.onResendCodeClicked();
                },
                child: Text("Resend code"),
              ),
            ),
          ],
          fixedAtBottomChild: [
            Expanded(
              child: ButtonFactory.buildUniversalButtonWithText(
                "VERIFY",
                context,
                () {
                  if (_formKey.currentState!.validate()) {
                    widget.onPinsubmitted();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
