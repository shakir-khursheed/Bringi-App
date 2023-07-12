import 'dart:io';

import 'package:bringi_app/common_resources/common_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageBottomSheet {
  void showPicImageBottomSheet({
    required Function onCameraPicked,
    required Function onGalleryPicked,
    required BuildContext context,
    String? title,
    String? subTitle,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CommonBottomSheet(
        title: title ?? "",
        subtitle: subTitle ?? "",
        widgets: [
          ListTile(
            leading: Icon(Icons.camera_enhance),
            title: Text("Take a picture"),
            onTap: () {
              Navigator.pop(context);
              onCameraPicked();
            },
          ),
          Row(
            children: [Expanded(child: Divider())],
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text("Upload from gallery"),
            onTap: () {
              Navigator.pop(context);
              onGalleryPicked();
            },
          ),
        ],
      ),
    );
  }

  Future<XFile?> pickImage(ImageSource source) async {
    try {
      XFile? imageFile = await ImagePicker().pickImage(
        source: source,
        maxHeight: double.maxFinite,
        maxWidth: double.maxFinite,
      );
      return imageFile;
    } on PathNotFoundException catch (e) {
      print(e);
    }
  }
}
