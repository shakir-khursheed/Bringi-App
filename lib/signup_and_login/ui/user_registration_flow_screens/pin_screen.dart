import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/common_resources/pin_input_field.dart';
import 'package:flutter/material.dart';
import '../../../common_resources/get_asset_image.dart';

class PinScreen extends StatefulWidget {
  final Function onPinsubmitted;
  const PinScreen({super.key, required this.onPinsubmitted});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: ListWithFixedButtonAtBottom(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
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
            "Verify Code send by distributor",
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
            onPinCompleted: (value) {},
            fieldvalidator: (value) {},
          ),
        ],
        fixedAtBottomChild: [
          Expanded(
            child: ButtonFactory.buildUniversalButtonWithText(
              "VERIFY",
              context,
              () {
                widget.onPinsubmitted();
              },
            ),
          )
        ],
      ),
    );
  }
}
