import 'package:bringi_app/common_resources/common_button.dart';
import 'package:flutter/material.dart';

class ProcessCompletionDialog extends StatefulWidget {
  final String title;
  final String subtitle;
  final String path;
  final Function onTap;
  final Widget? buttonLabel;
  final Color? buttoncolor;
  final bool? requireCloseButton;
  final Widget? closeButtonLabel;
  final bool? requireRefreshButton;
  const ProcessCompletionDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.path,
    required this.onTap,
    this.buttonLabel,
    this.buttoncolor,
    this.requireCloseButton,
    this.closeButtonLabel,
    this.requireRefreshButton,
  }) : super(key: key);
  @override
  State<ProcessCompletionDialog> createState() =>
      _ProcessCompletionDialogState();
}

class _ProcessCompletionDialogState extends State<ProcessCompletionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.requireRefreshButton ?? false,
            child: TextButton.icon(
              icon: Icon(Icons.refresh),
              onPressed: () {},
              label: Text("Refresh"),
            ),
          ),
          Icon(
            Icons.logout_sharp,
            size: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.subtitle,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Visibility(
                visible: widget.requireCloseButton ?? false,
                child: Expanded(
                  child: buttonForPasswordSentDialog(
                    buttonColor: widget.buttoncolor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonLabel: widget.closeButtonLabel,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: buttonForPasswordSentDialog(
                  buttonColor: widget.buttoncolor,
                  onTap: () {
                    widget.onTap();
                  },
                  buttonLabel: widget.buttonLabel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
