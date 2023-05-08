import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SecurityPinInputField extends StatefulWidget {
  final TextEditingController? controller;
  final Function onPinCompleted;
  final Function fieldvalidator;
  const SecurityPinInputField({
    Key? key,
    this.controller,
    required this.onPinCompleted,
    required this.fieldvalidator,
  }) : super(key: key);

  @override
  State<SecurityPinInputField> createState() => _SecurityPinInputFieldState();
}

class _SecurityPinInputFieldState extends State<SecurityPinInputField> {
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.white;
    const fillColor = Colors.white;
    const borderColor = Colors.black;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );
    return Pinput(
      length: 6,
      autofocus: true,
      controller: widget.controller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      validator: (value) => widget.fieldvalidator(value),
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
      onCompleted: (pin) => widget.onPinCompleted(pin),
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
