import 'package:flutter/material.dart';

class CommonBottomSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<Widget> widgets;
  const CommonBottomSheet({
    super.key,
    required this.title,
    required this.widgets,
    this.subtitle,
  });

  @override
  State<CommonBottomSheet> createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "${widget.title}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.subtitle}",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            Column(
              children: widget.widgets,
            )
          ],
        ),
      ),
    );
  }
}
