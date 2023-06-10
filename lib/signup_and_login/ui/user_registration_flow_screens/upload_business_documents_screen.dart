import 'dart:io';

import 'package:bringi_app/common_resources/common_bottom_sheet.dart';
import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:bringi_app/signup_and_login/viewmodel/user_registration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../common_resources/get_asset_image.dart';

class UploadBusinessDocumentScreen extends StatefulWidget {
  final UserRegistrationViewModel vm;
  const UploadBusinessDocumentScreen({super.key, required this.vm});

  @override
  State<UploadBusinessDocumentScreen> createState() =>
      _UploadBusinessDocumentScreenState();
}

class _UploadBusinessDocumentScreenState
    extends State<UploadBusinessDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: ListWithFixedButtonAtBottom(
        children: [
          Center(
            child: getAssetImage(
              "splash_logo.png",
              height: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Business Documents",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      BusinessDocumentCard(
                        documentFile: widget.vm.getDocumentProof1,
                        index: 1,
                        onTap: () {
                          showPicImageBottomSheet(
                            onCameraPicked: () async {
                              try {
                                var pickedImage =
                                    await _pickImage(ImageSource.camera);
                                widget.vm.setDocumentProof1 =
                                    File(pickedImage?.path ?? "");
                              } on PathNotFoundException catch (e) {
                                widget.vm.setDocumentProof1 = File("");
                              }
                            },
                            onGalleryPicked: () async {
                              try {
                                var pickedImage =
                                    await _pickImage(ImageSource.gallery);
                                widget.vm.setDocumentProof1 =
                                    File(pickedImage?.path ?? "");
                              } on PathNotFoundException catch (e) {
                                widget.vm.setDocumentProof1 = File("");
                              }
                            },
                          );
                        },
                      ),
                      BusinessDocumentCard(
                        documentFile: widget.vm.getDocumentProof2,
                        index: 2,
                        onTap: () {
                          showPicImageBottomSheet(
                            onCameraPicked: () async {
                              try {
                                var pickedImage =
                                    await _pickImage(ImageSource.camera);
                                widget.vm.setDocumentProof2 =
                                    File(pickedImage?.path ?? "");
                              } on PathNotFoundException catch (e) {
                                widget.vm.setDocumentProof2 = File("");
                              }
                            },
                            onGalleryPicked: () async {
                              try {
                                var pickedImage =
                                    await _pickImage(ImageSource.gallery);
                                widget.vm.setDocumentProof2 =
                                    File(pickedImage?.path ?? "");
                              } on PathNotFoundException catch (e) {
                                widget.vm.setDocumentProof2 = File("");
                              }
                            },
                          );
                        },
                      ),
                      BusinessDocumentCard(
                        documentFile: widget.vm.getDocumentProof3,
                        index: 3,
                        onTap: () {
                          showPicImageBottomSheet(
                            onCameraPicked: () async {
                              try {
                                var pickedImage =
                                    await _pickImage(ImageSource.camera);
                                widget.vm.setDocumentProof3 =
                                    File(pickedImage?.path ?? "");
                              } on PathNotFoundException catch (e) {
                                widget.vm.setDocumentProof3 = File("");
                              }
                            },
                            onGalleryPicked: () async {
                              try {
                                var pickedImage =
                                    await _pickImage(ImageSource.gallery);
                                widget.vm.setDocumentProof3 =
                                    File(pickedImage?.path ?? "");
                              } on PathNotFoundException catch (e) {
                                widget.vm.setDocumentProof3 = File("");
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: ((widget.vm.getDocumentProof1?.path != "" &&
                              widget.vm.getDocumentProof1 != null) ||
                          (widget.vm.getDocumentProof2?.path != "" &&
                              widget.vm.getDocumentProof2 != null) ||
                          (widget.vm.getDocumentProof3?.path != "" &&
                              widget.vm.getDocumentProof3 != null))
                      ? true
                      : false,
                  child: TextButton.icon(
                    onPressed: () {
                      widget.vm.setDocumentProof1 = File("");
                      widget.vm.setDocumentProof2 = File("");
                      widget.vm.setDocumentProof3 = File("");
                    },
                    icon: Icon(Icons.remove_circle),
                    label: Text("Remove documents"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
        fixedAtBottomChild: [
          Consumer<UserRegistrationViewModel>(
            builder: (context, vm, child) => Expanded(
              child: ButtonFactory.buildUniversalButtonWithText(
                "Submit",
                context,
                () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  BusinessDocumentCard(
      {int? index, required Function onTap, File? documentFile}) {
    return InkWell(
      onTap: () {
        print(documentFile?.path);
        onTap();
      },
      child: Card(
        child: (documentFile != null)
            ? (documentFile.path != "")
                ? Image(
                    image: FileImage(documentFile),
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text("Doc $index"),
                  )
            : Center(
                child: Text("Doc $index"),
              ),
      ),
    );
  }

  void showPicImageBottomSheet(
      {required Function onCameraPicked, required Function onGalleryPicked}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CommonBottomSheet(
        title: "Upload business documents",
        subtitle: "PAN card / GST / document of your shops",
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

  Future<XFile?> _pickImage(ImageSource source) async {
    XFile? imageFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: double.maxFinite,
      maxWidth: double.maxFinite,
    );
    return imageFile;
  }
}
