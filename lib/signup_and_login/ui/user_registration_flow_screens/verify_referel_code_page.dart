import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/common_resources/pin_input_field.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common_resources/get_asset_image.dart';

class VerifyReferrelCodeScreen extends StatefulWidget {
  final Function onPinsubmitted;
  const VerifyReferrelCodeScreen({
    super.key,
    required this.onPinsubmitted,
  });

  @override
  State<VerifyReferrelCodeScreen> createState() =>
      _VerifyReferrelCodeScreenState();
}

class _VerifyReferrelCodeScreenState extends State<VerifyReferrelCodeScreen> {
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
              "Verify refferel code",
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
                widget.onPinsubmitted(code);
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
          ],
          fixedAtBottomChild: [
            Consumer<UserRegistrationViewModel>(
              builder: (context, vm, child) => Expanded(
                child: ButtonFactory.buildUniversalButtonWithText(
                    "VERIFY", context, () {
                  if (_formKey.currentState!.validate()) {
                    widget.onPinsubmitted(code);
                  }
                }, showLoading: vm.showLoading),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
