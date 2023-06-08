import 'dart:io';

import 'package:bringi_app/common_resources/common_bottom_sheet.dart';
import 'package:bringi_app/common_resources/common_button.dart';
import 'package:bringi_app/common_resources/list_with_fixed_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common_resources/get_asset_image.dart';

class UploadBusinessDocumentScreen extends StatefulWidget {
  const UploadBusinessDocumentScreen({super.key});

  @override
  State<UploadBusinessDocumentScreen> createState() =>
      _UploadBusinessDocumentScreenState();
}

class _UploadBusinessDocumentScreenState
    extends State<UploadBusinessDocumentScreen> {
  File? documentProof1;
  File? documentProof2;
  File? documentProof3;

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
                        documentFile: documentProof1,
                        index: 1,
                        onTap: () {
                          showPicImageBottomSheet(
                            onCameraPicked: () async {
                              var cameraPickedImage =
                                  await _pickImage(ImageSource.camera);
                              setState(() {
                                documentProof1 = File(cameraPickedImage!.path);
                              });
                            },
                            onGalleryPicked: () async {
                              var galleryPickedImage =
                                  await _pickImage(ImageSource.gallery);
                              setState(() {
                                documentProof1 = File(galleryPickedImage!.path);
                              });
                            },
                          );
                        },
                      ),
                      BusinessDocumentCard(
                        documentFile: documentProof2,
                        index: 2,
                        onTap: () {
                          showPicImageBottomSheet(
                            onCameraPicked: () async {
                              var cameraPickedImage =
                                  await _pickImage(ImageSource.camera);
                              setState(() {
                                documentProof2 = File(cameraPickedImage!.path);
                              });
                            },
                            onGalleryPicked: () async {
                              var galleryPickedImage =
                                  await _pickImage(ImageSource.gallery);
                              setState(() {
                                documentProof2 = File(galleryPickedImage!.path);
                              });
                            },
                          );
                        },
                      ),
                      BusinessDocumentCard(
                        documentFile: documentProof3,
                        index: 3,
                        onTap: () {
                          showPicImageBottomSheet(
                            onCameraPicked: () async {
                              var cameraPickedImage =
                                  await _pickImage(ImageSource.camera);
                              setState(() {
                                documentProof3 = File(cameraPickedImage!.path);
                              });
                            },
                            onGalleryPicked: () async {
                              var galleryPickedImage =
                                  await _pickImage(ImageSource.gallery);
                              setState(() {
                                documentProof3 = File(galleryPickedImage!.path);
                              });
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
        fixedAtBottomChild: [
          Expanded(
            child: ButtonFactory.buildUniversalButtonWithText(
              "Submit",
              context,
              () {},
            ),
          )
        ],
      ),
    );
  }

  BusinessDocumentCard(
      {int? index, required Function onTap, File? documentFile}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        child: (documentFile != null)
            ? Center(
                child: Image(
                  image: FileImage(documentFile),
                  fit: BoxFit.cover,
                ),
              )
            : Center(
                child: Text("Doc $index"),
              ),
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
              onGalleryPicked();
            },
          ),
        ],
      ),
    );
  }
}
