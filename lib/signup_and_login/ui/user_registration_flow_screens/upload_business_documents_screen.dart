import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/signup_and_login/ui/user_registration_flow_screens/scan_business_doc_page.dart';
import 'package:flutter/material.dart';

import '../../../common_resources/get_asset_image.dart';

class UploadBusinessDocumentScreen extends StatefulWidget {
  const UploadBusinessDocumentScreen({super.key});

  @override
  State<UploadBusinessDocumentScreen> createState() =>
      _UploadBusinessDocumentScreenState();
}

class _UploadBusinessDocumentScreenState
    extends State<UploadBusinessDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
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
            "Business Documents",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                BusinessDocumentCard(),
                BusinessDocumentCard(),
                BusinessDocumentCard(),
              ],
            ),
          )
        ],
        fixedAtBottomChild: [
          Expanded(
            child: ButtonFactory.buildUniversalButtonWithText(
              "Submit",
              context,
              () {},
            ),
          )
        ],
      ),
    );
  }

  BusinessDocumentCard() {
    return InkWell(
      onTap: () {
        navigateToUploadDocumentPage();
      },
      child: Card(
        child: Center(
          child: Text("Doc 1"),
        ),
      ),
    );
  }

  void navigateToUploadDocumentPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanBusinessDocument(),
      ),
    );
  }
}
