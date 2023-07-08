import 'package:bringi_app/base/base_state.dart';
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
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    backgroundColor: HexColor.fromHex("051E43"),
    elevation: 0,
    leading: (requireBackButton ?? true)
        ? IconButton(
            onPressed: () {
              onTap();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          )
        : SizedBox(),
    actions: actions,
  );
}
