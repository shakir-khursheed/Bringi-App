import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';

import '../../../common_resources/common_button.dart';

class AddBusinessDetailScreen extends StatefulWidget {
  const AddBusinessDetailScreen({super.key});

  @override
  State<AddBusinessDetailScreen> createState() =>
      _AddBusinessDetailScreenState();
}

class _AddBusinessDetailScreenState extends State<AddBusinessDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ListWithFixedButtonAtBottom(
      children: [],
      fixedAtBottomChild: [
        Expanded(
          child: ButtonFactory.buildUniversalButtonWithText(
            "UPLOAD DOCUMENT",
            context,
            () {},
          ),
        )
      ],
    );
  }
}
