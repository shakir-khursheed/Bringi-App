import 'package:bringi_app/common_resources/common_input_field.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';

import '../../../common_resources/common_button.dart';
import '../../../common_resources/get_asset_image.dart';

class AddBusinessDetailScreen extends StatefulWidget {
  final Function onBusinessDetailsUploaded;
  const AddBusinessDetailScreen(
      {super.key, required this.onBusinessDetailsUploaded});

  @override
  State<AddBusinessDetailScreen> createState() =>
      _AddBusinessDetailScreenState();
}

class _AddBusinessDetailScreenState extends State<AddBusinessDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTextChange: (text) {},
            labelText: "Retailer name",
            textInputType: TextInputType.name,
            fieldValidator: (value) {},
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
            onTextChange: (text) {},
            labelText: "Address",
            textInputType: TextInputType.name,
            fieldValidator: (value) {},
            maxlength: 30,
            isAutovalidateModeon: false,
          ),
        ],
        fixedAtBottomChild: [
          Expanded(
            child: ButtonFactory.buildUniversalButtonWithText(
              "Continue",
              context,
              () {
                widget.onBusinessDetailsUploaded();
              },
            ),
          )
        ],
      ),
    );
  }
}
