import 'package:flutter/material.dart';

Widget getAssetImage(String assetName,
    {double? height, double? width, BoxFit? fit}) {
  return Image.asset(
    "assets/images/$assetName",
    height: height,
    width: width,
    fit: fit,
  );
}
