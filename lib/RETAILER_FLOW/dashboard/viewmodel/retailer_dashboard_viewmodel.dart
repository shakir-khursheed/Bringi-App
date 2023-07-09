import 'dart:io';
import 'dart:math';

import 'package:bringi_app/RETAILER_FLOW/dashboard/navigator/retailer_dashboard_navigator.dart';
import 'package:bringi_app/RETAILER_FLOW/dashboard/repo/retailer_repo.dart';
import 'package:bringi_app/Response_model/checked_out_product_response.dart';
import 'package:bringi_app/Response_model/orders_response.dart';
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

  void getSavedAddress() async {
    showLoading = true;
    try {
      var response = await repository.getSavedAddress();
      savedAddresses = response.addresses;
      notifyListeners();
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  void saveAddress({
    String? address,
    String? city,
    String? pincode,
  }) async {
    showLoading = true;
    retailerAddress.add({
      "address": address,
      "city": city,
      "pincode": pincode,
    });
    try {
      await repository.saveAddress(
        address: retailerAddress,
      );
      getNavigator().onAddressSavedSucessfully();
      getNavigator().showMessage("Address saved successfully");
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< CREATE ORDER SECTION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Future<String> getuid() async {
    var response = await repository.getUid();
    return response ?? '';
  }

  void addToInventory({
    String? productName,
    String? amount,
    int? count,
    String? imageUrl,
    String? productId,
  }) async {
    loading = true;
    notifyListeners();
    try {
      await _db
          .collection("Retailer")
          .doc(await repository.getUid())
          .collection("inventory")
          .doc(productId)
          .set({
        "productName": productName,
        "amount": amount,
        "count": count,
        "imageUrl": imageUrl,
        "productId": productId,
      }).whenComplete(() => {
                getNavigator().showMessage(
                  "Item Added to invertory",
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

  void removeFromInventory({String? productId}) async {
    loading = true;
    notifyListeners();
    try {
      await _db
          .collection("Retailer")
          .doc(await repository.getUid())
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

  void addToCheckout(
      {String? address, String? productName, String? totalAmount}) async {
    showLoading = true;
    try {
      await repository.addTocheckOut(
        orderId: "# ${await generateOrderId()}",
        address: address,
        productName: productName,
        amount: totalAmount,
      );
    } on SocketException {
    } catch (e) {
    } finally {
      showLoading = false;
    }
  }

  Future<String> generateOrderId() async {
    var orderId = await Random().nextInt(9999999);
    return orderId.toString();
  }

  void getCheckoutProduct() async {
    showLoading = true;
    try {
      checkoutProductResponse = await repository.getcheckedOutProduct();
      notifyListeners();
    } on SocketException {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      showLoading = false;
    }
  }

  void CreateOrder({
    String? orderId,
    String? deliveryAddress,
    String? orderAmount,
    String? orderCount,
    String? productName,
    String? productQuantity,
    String? orderStatus,
    String? AssignedTo,
    String? createdAt,
    String? updatedAt,
  }) async {
    showLoading = true;
    try {
      await repository.createOrder(
        orderId: orderId,
        deliveryAddress: deliveryAddress,
        orderAmount: orderAmount,
        orderCount: orderCount,
        productName: productName,
        productQuantity: productQuantity,
        orderStatus: orderStatus,
        AssignedTo: AssignedTo,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
      getNavigator().onOrderCreatedSuccessfully();
    } on SocketException {
    } catch (e) {
      getNavigator().showMessage("$e", color: Colors.red[900]);
    } finally {
      showLoading = false;
    }
  }
}
