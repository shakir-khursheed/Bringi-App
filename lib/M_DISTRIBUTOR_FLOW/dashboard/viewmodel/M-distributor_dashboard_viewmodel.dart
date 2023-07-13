import 'dart:io';
import 'dart:math';

import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/Mbottom_navbar_view.dart';
import 'package:bringi_app/M_DISTRIBUTOR_FLOW/dashboard/ui/manage_inventory_options/add_product_process/add_product_pricing.dart';
import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../navigator/M-distributor_dashboard_navigator.dart';
import '../repo/M-distributor_repo.dart';

class MDistributorDashboardViewModel extends BaseViewModel<
    MDistributorDashboardNavigator, MDistributorDashboardRepo> {
  bool loading = false;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  bool _isAllProductsAvailable = true;
  bool _packof12Available = false;
  bool _packof24Available = false;
  bool _packof60Available = false;
  bool _packof120Available = false;
  static String? productImageUrl;

  set setAllProductsAvailable(bool value) {
    _isAllProductsAvailable = value;
    notifyListeners();
  }

  bool get AreAllProductsAvailable => _isAllProductsAvailable;

  set setpackof12Available(bool value) {
    _packof12Available = value;
    notifyListeners();
  }

  bool get Arepackof12Available => _packof12Available;

  set setpackof24Available(bool value) {
    _packof24Available = value;
    notifyListeners();
  }

  bool get Arepackof24Available => _packof24Available;

  set setpackof60Available(bool value) {
    _packof60Available = value;
    notifyListeners();
  }

  bool get Arepackof60Available => _packof60Available;

  set setpackof120Available(bool value) {
    _packof120Available = value;
    notifyListeners();
  }

  bool get Arepackof120Available => _packof120Available;

  Future<String> getuid() async {
    var response = await repository.getPhoneNo();
    return response ?? '';
  }

  void uploadProductDetails(File image, BuildContext context,
      String productName, String productDiscription) async {
    showLoading = true;
    try {
      await _storage
          .ref()
          .child(
              "Master_product_image/${await repository.getPhoneNo()} / $image}")
          .putFile(image)
          .then((p0) async {
        productImageUrl = await p0.ref.getDownloadURL();
        navigateToPricingPage(context, productName, productDiscription);
        getNavigator().showMessage("Product Details uploaded successfully");
      });
    } catch (e) {
      print(e);
    } finally {
      showLoading = false;
    }
  }

  navigateToPricingPage(
      BuildContext context, String productName, String productDiscription) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddProductPricingAndQuantity(
          productName: productName,
          productDiscription: productDiscription,
        ),
      ),
    );
  }

  void AddProduct(
    BuildContext context, {
    String? productName,
    String? productDiscription,
    String? productQuantity,
    String? inStock,
    String? pack12Price,
    String? pack24Price,
    String? pack60Price,
    String? pack120Price,
    String? marginForPackof12,
    String? marginForPackof24,
    String? marginForPackof60,
    String? marginForPackof120,
    String? mrpofPackof12,
    String? mrpofPackof24,
    String? mrpofPackof60,
    String? mrpofPackof120,
    String? gst,
    String? hns,
  }) async {
    showLoading = true;
    try {
      await _db.collection("Master-Products").doc().set({
        "productId": await generateProductId(),
        "productName": productName,
        "productDiscription": productDiscription,
        "imageUrl": productImageUrl,
        "productQuantity": productQuantity,
        "InStock": inStock,
        "packof12Price": pack12Price,
        "packof24Price": pack24Price,
        "packof60Price": pack60Price,
        "packof120Price": pack120Price,
        "marginof12Pack": marginForPackof12,
        "marginof24Pack": marginForPackof24,
        "marginof60Pack": marginForPackof60,
        "marginof120Pack": marginForPackof120,
        "mrpf12Pack": mrpofPackof12,
        "mrpof24Pack": mrpofPackof24,
        "mrpof60Pack": mrpofPackof60,
        "mrpof120Pack": mrpofPackof120,
        "hsn": hns,
        "gst": gst,
      }).whenComplete(() => {
            navigateToDashboard(context),
            getNavigator().showMessage("Product added sucessfully"),
          });
    } on SocketException catch (e) {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      showLoading = false;
    }
  }

  Stream<QuerySnapshot> getMasterProducts() {
    showLoading = true;
    var response = _db.collection("Master-Products").snapshots();
    try {
      var response = _db.collection("Master-Products").snapshots();
      return response;
    } on SocketException catch (e) {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      showLoading = false;
    }
    return response;
  }

  navigateToDashboard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MDistriButorBottomNavbarView()),
    );
  }

  Future<String> generateProductId() async {
    var orderId = await Random().nextInt(999999999);
    return orderId.toString();
  }

  Stream<QuerySnapshot> adminproducts() {
    loading = true;
    notifyListeners();
    try {
      return _db.collection('products').snapshots();
    } on SocketException catch (e) {
      // Handle socket exception
      return Stream.error(e);
    } catch (e) {
      // Handle other exceptions
      getNavigator().showMessage("$e", color: Colors.red[900]);
      return Stream.empty();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
