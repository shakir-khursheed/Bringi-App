import 'package:flutter/material.dart';

AppBar commonAppbarForScreens({
  required String title,
  required Function onTap,
  bool? requireBackButton,
  List<Widget>? actions,
  Color? backColor,
  required bool centerTitle,
}) {
  return AppBar(
    centerTitle: centerTitle,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: (requireBackButton ?? true)
        ? IconButton(
            onPressed: () {
              onTap();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: (backColor != null) ? backColor : Colors.black,
              size: 20,
            ),
          )
        : SizedBox(),
    actions: actions,
  );
}
