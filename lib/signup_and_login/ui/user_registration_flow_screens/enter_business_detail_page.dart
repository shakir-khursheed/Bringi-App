import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/map_screen.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_resources/common_button.dart';
import '../../../common_resources/get_asset_image.dart';

class AddBusinessDetailScreen extends StatefulWidget {
  final Function onBusinessDetailsUploaded;
  const AddBusinessDetailScreen({
    super.key,
    required this.onBusinessDetailsUploaded,
  });

  @override
  State<AddBusinessDetailScreen> createState() =>
      _AddBusinessDetailScreenState();
}

class _AddBusinessDetailScreenState extends State<AddBusinessDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? address;

  @override
  void initState() {
    super.initState();
  }

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
              "Business Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<UserRegistrationViewModel>(
              builder: (context, vm, child) => CommonInputField(
                prefixIcon: Icon(
                  Icons.store,
                  color: Colors.black,
                  size: 25,
                ),
                onTextChange: (text) {
                  name = text;
                },
                labelText: "${vm.role} name",
                textInputType: TextInputType.name,
                fieldValidator: (value) {
                  if (value.toString().length <= 2 &&
                      value.toString().isNotEmpty) {
                    return "Please enter value name atleast 4 characters";
                  }
                  if (value.toString().isEmpty) {
                    return "Name cannot be empty";
                  }
                },
                maxlength: 30,
                isAutovalidateModeon: false,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CommonInputField(
              requireSuffixIcon: true,
              suffixIcon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreen(),
                      ));
                },
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.black,
                ),
              ),
              prefixIcon: Icon(
                Icons.pin_drop_rounded,
                color: Colors.black,
                size: 25,
              ),
              onTextChange: (text) {
                address = text;
              },
              labelText: "Address",
              textInputType: TextInputType.name,
              fieldValidator: (value) {
                if (value.toString().length <= 2 &&
                    value.toString().isNotEmpty) {
                  return "Please enter valid address atleast 4 characters";
                }
                if (value.toString().isEmpty) {
                  return "Address cannot be empty";
                }
              },
              maxlength: 50,
              isAutovalidateModeon: false,
            ),
          ],
          fixedAtBottomChild: [
            Expanded(
              child: ButtonFactory.buildUniversalButtonWithText(
                "Continue",
                context,
                () {
                  if (_formKey.currentState!.validate()) {
                    widget.onBusinessDetailsUploaded(address, name);
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
