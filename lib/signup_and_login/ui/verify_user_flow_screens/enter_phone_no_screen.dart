import 'dart:ui';

import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common_resources/common_button.dart';
import '../../../common_resources/get_asset_image.dart';
import '../../../common_resources/list_with_fixed_button.dart';

class EnterPhoneNoScreen extends StatefulWidget {
  final Function onPhoneNoEntered;
  final bool showLoading;
  const EnterPhoneNoScreen(
      {super.key, required this.onPhoneNoEntered, required this.showLoading});

  @override
  State<EnterPhoneNoScreen> createState() => _EnterPhoneNoScreenState();
}

class _EnterPhoneNoScreenState extends State<EnterPhoneNoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? mobileNo;

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
                Text(
                  "Login to continue in Bringi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Mobile no",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CommonInputField(
              inputFormatter: [
                FilteringTextInputFormatter.allow(
                  RegExp("[0-9]"),
                )
              ],
              onTextChange: (text) {
                mobileNo = text;
              },
              labelText: "Enter mobile no",
              textInputType: TextInputType.number,
              fieldValidator: (value) {
                if (value.toString().isEmpty) {
                  return "Mobile no cannot be empty";
                }
                if (value.toString().isNotEmpty &&
                    value.toString().length < 10) {
                  return "Please enter valid mobile no";
                }
              },
              maxlength: 10,
              isAutovalidateModeon: false,
            )
          ],
          fixedAtBottomChild: [
            Consumer<UserRegistrationViewModel>(
              builder: (context, vm, child) => Expanded(
                child: ButtonFactory.buildUniversalButtonWithText(
                  "NEXT",
                  context,
                  () {
                    if (_formKey.currentState!.validate()) {
                      widget.onPhoneNoEntered(mobileNo);
                    }
                  },
                  showLoading: vm.showLoading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
