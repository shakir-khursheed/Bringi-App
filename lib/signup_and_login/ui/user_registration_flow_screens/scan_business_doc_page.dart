import 'package:flutter/material.dart';

import '../../../common_resources/common_button.dart';
import '../../../common_resources/list_with_fixed_button.dart';

class ScanBusinessDocument extends StatefulWidget {
  const ScanBusinessDocument({super.key});

  @override
  State<ScanBusinessDocument> createState() => _ScanBusinessDocumentState();
}

class _ScanBusinessDocumentState extends State<ScanBusinessDocument> {
  @override
  Widget build(BuildContext context) {
    return ListWithFixedButtonAtBottom(
      children: [],
      fixedAtBottomChild: [
        Expanded(
          child: ButtonFactory.buildUniversalButtonWithText(
            "UPLOAD FROM GALLERY",
            context,
            () {},
          ),
        )
      ],
    );
  }
}
