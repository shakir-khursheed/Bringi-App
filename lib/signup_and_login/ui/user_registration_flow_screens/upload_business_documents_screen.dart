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
  final Function addDocument;
  final Function removeDocument;
  final Function removeAllDocuments;
  const UploadBusinessDocumentScreen({
    super.key,
    required this.vm,
    required this.addDocument,
    required this.removeDocument,
    required this.removeAllDocuments,
  });

  @override
  State<UploadBusinessDocumentScreen> createState() =>
      _UploadBusinessDocumentScreenState();
}

class _UploadBusinessDocumentScreenState
    extends State<UploadBusinessDocumentScreen> {
  String? role;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
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
            height: 10,
          ),
          Text(
            "Add business documents for KYC verification (note: remove document by long press)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w200,
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
                  child: GridView.builder(
                    itemCount: widget.vm.documentProofs.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return (index == 0)
                          ? InkWell(
                              onTap: () {
                                (widget.vm.documentProofs.length >= 4)
                                    ? widget.removeAllDocuments()
                                    : showPicImageBottomSheet(
                                        onCameraPicked: () async {
                                          final pickedImage = await _pickImage(
                                              ImageSource.camera);
                                          widget.addDocument(
                                              File(pickedImage?.path ?? ""));
                                        },
                                        onGalleryPicked: () async {
                                          final pickedImage = await _pickImage(
                                              ImageSource.gallery);
                                          widget.addDocument(
                                              File(pickedImage?.path ?? ""));
                                        },
                                      );
                              },
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      (widget.vm.documentProofs.length >= 4)
                                          ? Icons.remove_circle
                                          : Icons.add_circle,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      (widget.vm.documentProofs.length >= 4)
                                          ? "Remove all"
                                          : "Add document",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : BusinessDocumentCard(
                              index: index - 1,
                              documentFile: widget.vm.documentProofs,
                              onLongPress: () {
                                widget.removeDocument(index);
                              });
                    },
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
          Consumer<UserRegistrationViewModel>(
            builder: (context, vm, child) => Expanded(
              child: ButtonFactory.buildUniversalButtonWithText(
                "Submit",
                context,
                () {
                  vm.uploadDocuments();
                },
                showLoading: vm.showLoading,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BusinessDocumentCard(
      {int? index, List<File?>? documentFile, required Function onLongPress}) {
    return InkWell(
        onLongPress: () {
          onLongPress();
        },
        child: (documentFile?[index ?? 0]?.path != "")
            ? Image(
                image: FileImage(documentFile![index ?? 0]!),
                fit: BoxFit.cover,
              )
            : null);
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
