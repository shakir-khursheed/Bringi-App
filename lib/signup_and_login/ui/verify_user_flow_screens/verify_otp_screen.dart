import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/common_resources/pin_input_field.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common_resources/get_asset_image.dart';

class VerifyOTPScreen extends StatefulWidget {
  final Function onPinsubmitted;
  final Function onResendCodeClicked;
  final String? mobileNo;
  final bool showLoading;
  const VerifyOTPScreen(
      {super.key,
      required this.onPinsubmitted,
      required this.onResendCodeClicked,
      required this.showLoading,
      this.mobileNo});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Verify code send on ${widget.mobileNo}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter SMS code",
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
                widget.onPinsubmitted(value);
              },
              fieldvalidator: (value) {
                if (value.toString().length < 6 &&
                    value.toString().isNotEmpty) {
                  return "SMS code should be 6 digits";
                }
                if (value.toString().isEmpty) {
                  return "SMS code cannot be empty";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<UserRegistrationViewModel>(
              builder: (context, vm, child) => TextButton(
                onPressed: (vm.startTimer != 0)
                    ? () {}
                    : () {
                        widget.onResendCodeClicked();
                      },
                child: Row(
                  children: [
                    Text(
                      "Resend code",
                      style: TextStyle(
                          color:
                              (vm.startTimer != 0) ? Colors.grey : Colors.blue),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Visibility(
                        visible: (vm.startTimer != 0) ? true : false,
                        child: Text("${vm.time}")),
                  ],
                ),
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
                    widget.onPinsubmitted(code);
                  }
                },
                showLoading: widget.showLoading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
