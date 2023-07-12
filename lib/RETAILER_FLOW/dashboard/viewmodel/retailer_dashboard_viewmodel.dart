import 'dart:io';
import 'dart:math';

import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/repo/retailer_repo.dart';
import 'package:bringi_app/Response_model/checked_out_product_response.dart';
import 'package:bringi_app/Response_model/product_list_response.dart';
import 'package:bringi_app/Response_model/saved_address_response.dart';
import 'package:bringi_app/base/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RetailerDashboardViewModel
    extends BaseViewModel<RetailerDashboardNavigator, RetailerDashboardRepo> {
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< DASHBOARD SECTION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  List<ListOfProduct> productList = List.empty(growable: true);
  ListOfProduct? product;
  bool? _Is12PackSelected;
  bool? _Is24PackSelected;
  bool? _Is60PackSelected;
  bool? _Is120PackSelected;
  bool loading = false;
  CheckoutProductResponse? checkoutProductResponse;
  static List<Map<String, dynamic>> retailerAddress = [];
  List<Address> savedAddresses = List.empty(growable: true);
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String? defaultAddress;

  bool? get is12Selected => _Is12PackSelected;
  set setIs12Selected(bool? value) {
    _Is12PackSelected = value;
    notifyListeners();
  }

  bool? get is24Selected => _Is24PackSelected;
  set setIs24Selected(bool? value) {
    _Is24PackSelected = value;
    notifyListeners();
  }

  bool? get is60Selected => _Is60PackSelected;
  set setIs60Selected(bool? value) {
    _Is60PackSelected = value;
    notifyListeners();
  }

  bool? get is120Selected => _Is120PackSelected;
  set setIs120Selected(bool? value) {
    _Is120PackSelected = value;
    notifyListeners();
  }

  void getProducts() async {
    showLoading = true;
    try {
      var response = await repository.getProducts();
      productList = response.listOfProducts;
      notifyListeners();
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  void getProductDetails(String productId) async {
    showLoading = true;
    try {
      var response = await repository.getProducts();
      product = response.listOfProducts.firstWhere(
        (element) => element.userid == productId,
      );
      notifyListeners();
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PROFILE SECTION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  void saveAddress({
    String? address,
    String? city,
    String? pincode,
  }) async {
    showLoading = true;
    try {
      await _db
          .collection("Addresses")
          .doc(await repository.getPhoneNo())
          .collection("SavedAddress")
          .doc()
          .set({
        "Address": address,
        "city": city,
        "pincode": pincode,
      }).whenComplete(() => {
                getNavigator().onAddressSavedSucessfully(),
                getNavigator().showMessage("Address saved successfully")
              });
    } on SocketException {
    } catch (e) {
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

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< CREATE ORDER SECTION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Future<String> getuid() async {
    var response = await repository.getPhoneNo();
    return response ?? '';
  }

  void addToInventory({
    String? productName,
    String? amount,
    int? count,
    String? imageUrl,
    String? productId,
    String? productQuantity,
  }) async {
    loading = true;
    notifyListeners();
    try {
      await _db
          .collection("Retailer")
          .doc(await repository.getPhoneNo())
          .collection("inventory")
          .doc(productId)
          .set({
        "productName": productName,
        "amount": amount,
        "count": count,
        "imageUrl": imageUrl,
        "productQuantity": productQuantity,
        "productId": productId,
      }).whenComplete(() => {
                getNavigator().showMessage(
                  "Item Added to invertory",
                ),
              });
    } on SocketException catch (e) {
    } catch (e) {
      // getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void removeFromInventory({String? productId}) async {
    loading = true;
    notifyListeners();
    try {
      await _db
          .collection("Retailer")
          .doc(await repository.getPhoneNo())
          .collection("inventory")
          .doc(productId)
          .delete()
          .whenComplete(() => {
                getNavigator().showMessage(
                  "Item removed from invertory",
                ),
              });
    } on SocketException catch (e) {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void updateInventory({String? productId, int? count}) async {
    loading = true;
    notifyListeners();
    try {
      await _db
          .collection("Retailer")
          .doc(await repository.getPhoneNo())
          .collection("inventory")
          .doc(productId)
          .update({
        "count": count,
      });
    } on SocketException catch (e) {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> CreateOrder({
    String? deliveryAddress,
    String? pickupAddress,
    String? deliveryPincode,
    String? pickupPincode,
    String? orderAmount,
    String? orderType,
    String? orderCount,
    String? productName,
    String? retailerName,
    String? productQuantity,
    String? orderStatus,
    String? AssignedTo,
    String? createdAt,
    String? updatedAt,
    bool? deliveryAccepted,
    bool? OrderAccepted,
  }) async {
    showLoading = true;
    try {
      await _db.collection("Orders").doc().set({
        "orderId": await generateOrderId(),
        "deliveryAddress": deliveryAddress,
        "pickupAddress": pickupAddress,
        "deliveryPincode": deliveryPincode,
        "pickupPincode": pickupPincode,
        "orderAmount": orderAmount,
        "orderCount": orderCount,
        "orderType": orderType,
        "productName": productName,
        "productQuantity": productQuantity,
        "RetailerName": retailerName,
        "orderStatus": orderStatus,
        "AssignedTo": AssignedTo,
        "orderAccepted": OrderAccepted,
        "deliveryAccepted": deliveryAccepted,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      });
      getNavigator().onOrderCreatedSuccessfully();
      getNavigator().showMessage("Order created successfully");
    } on SocketException {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      showLoading = false;
    }
  }

  Future<String> generateOrderId() async {
    var orderId = await Random().nextInt(100000000) + 1000;
    return orderId.toString();
  }

  void logout() {
    repository.deleteSession();
    getNavigator().navigateToVerifyUserFlow();
  }
}
