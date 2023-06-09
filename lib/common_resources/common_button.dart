import 'package:flutter/material.dart';

import '../base/base_state.dart';

class ButtonWithLoader extends StatefulWidget {
  final Function onPressed;
  final bool showLoading;
  final String label;
  final bool? isdisabled;
  final Color? buttonColor;
  const ButtonWithLoader(
      {Key? key,
      required this.onPressed,
      required this.showLoading,
      required this.label,
      this.buttonColor,
      this.isdisabled})
      : super(key: key);
  @override
  State<ButtonWithLoader> createState() => _ButtonWithLoaderState();
}

class _ButtonWithLoaderState extends State<ButtonWithLoader> {
  @override
  Widget build(BuildContext context) {
    return (!widget.showLoading)
        ? InkWell(
            onTap: (widget.isdisabled ?? false)
                ? () {}
                : () {
                    FocusScope.of(context).unfocus();
                    widget.onPressed();
                  },
            child: Container(
              decoration: BoxDecoration(
                color: (widget.isdisabled ?? false)
                    ? HexColor.fromHex("#C9C9C9")
                    : (widget.buttonColor != null)
                        ? widget.buttonColor
                        : HexColor.fromHex("#FFFFFF"),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox(
            height: 40,
            width: 40,
            child: Center(child: CircularProgressIndicator()));
  }
}

class ButtonFactory {
  static Widget buildUniversalButtonWithText(
      String label, BuildContext context, Function onPressed,
      {bool isdisabled = false, bool showLoading = false, Color? buttonColor}) {
    return ButtonWithLoader(
      onPressed: onPressed,
      showLoading: showLoading,
      label: label,
      isdisabled: isdisabled,
      buttonColor: buttonColor,
    );
  }
}

MaterialButton buttonForPasswordSentDialog(
    {Function? onTap, Widget? buttonLabel, Color? buttonColor}) {
  return MaterialButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
    ),
    color: buttonColor,
    onPressed: () {
      onTap!();
    },
    child: buttonLabel,
  );
}
