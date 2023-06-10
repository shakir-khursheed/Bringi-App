import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/constants/role_identifier.dart';
import 'package:flutter/material.dart';

import '../../../common_resources/common_button.dart';
import '../../../common_resources/get_asset_image.dart';

class AddBusinessDetailScreen extends StatefulWidget {
  final Function onBusinessDetailsUploaded;
  final RoleIdentifier roleIdentifier;
  const AddBusinessDetailScreen({
    super.key,
    required this.onBusinessDetailsUploaded,
    required this.roleIdentifier,
  });

  @override
  State<AddBusinessDetailScreen> createState() =>
      _AddBusinessDetailScreenState();
}

class _AddBusinessDetailScreenState extends State<AddBusinessDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? address;
  String? role;

  @override
  void initState() {
    checkRole();
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
            CommonInputField(
              prefixIcon: Icon(
                Icons.store,
                color: Colors.black,
                size: 25,
              ),
              onTextChange: (text) {
                name = text;
              },
              labelText: "$role name",
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
            SizedBox(
              height: 20,
            ),
            CommonInputField(
              requireSuffixIcon: true,
              suffixIcon: IconButton(
                onPressed: () {},
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

  void checkRole() {
    switch (widget.roleIdentifier) {
      case RoleIdentifier.RETAILER:
        {
          role = "Retailer";
          break;
        }
      case RoleIdentifier.DISTRIBUTOR:
        {
          role = "Distributor";
          break;
        }
      case RoleIdentifier.MASTERDISTRIBUTOR:
        {
          role = "Master-Distributor";
          break;
        }
      case RoleIdentifier.AGENT:
        {
          role = "Agent";
          break;
        }
    }
  }
}
