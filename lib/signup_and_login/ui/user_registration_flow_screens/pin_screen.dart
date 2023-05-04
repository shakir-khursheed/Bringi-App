import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return ListWithFixedButtonAtBottom(
      children: [],
      fixedAtBottomChild: [],
    );
  }
}
