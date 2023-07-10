import 'package:bringi_app/Response_model/checked_out_product_response.dart';
import 'package:bringi_app/Response_model/orders_response.dart';
import 'package:bringi_app/Response_model/saved_address_response.dart';
import 'package:bringi_app/base/base_webApi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Response_model/product_list_response.dart';
import '../../../signup_and_login/model/usermodel.dart';

abstract class RetailerDashboardWebApi extends BaseWebApi {
  Future<ProductListResponse> getProducts();
  Future<void> saveAddress({
    List<Map<String, dynamic>>? address,
    String? uid,
  });
  Future<SavedAddressResponse> getSavedAddress({
    String? uid,
  });
  Future<void> addTocheckOut({
    String? orderId,
    String? productName,
    String? amount,
    String? address,
    String? uid,
  });
  Future<CheckoutProductResponse> getcheckedOutProduct({
    String? uid,
  });
  Future<void> createOrder({
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
    String? uid,
  });
}

class RetailerDashboardWebApiImpl implements RetailerDashboardWebApi {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<ProductListResponse> getProducts() async {
    var response =
        await _db.collection("products").doc("rOT4j6uJSfJ5938snkw5").get();
    return ProductListResponse.fromJson(response);
  }

  @override
  Future<void> saveAddress(
      {List<Map<String, dynamic>>? address, String? uid}) async {
    await _db.collection("User_address").doc(uid).set(
      {
        "Addresses": address,
      },
    );
  }

  @override
  Future<SavedAddressResponse> getSavedAddress({String? uid}) async {
    var response = await _db.collection("User_address").doc(uid).get();
    return SavedAddressResponse.fromJson(response);
  }

  @override
  Future<void> addTocheckOut({
    String? orderId,
    String? productName,
    String? amount,
    String? address,
    String? uid,
  }) async {
    await _db.collection("checkout_product").doc(uid).set({
      "orderId": orderId,
      "productName": productName,
      "amount": amount,
      "address": address,
    });
  }

  @override
  Future<CheckoutProductResponse> getcheckedOutProduct({String? uid}) async {
    var response = await _db.collection("checkout_product").doc(uid).get();
    return CheckoutProductResponse.fromJson(response);
  }

  @override
  Future<void> createOrder({
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
    String? uid,
  }) async {
    await _db.collection("Orders").doc().set({
      "orderId": orderId,
      "deliveryAddress": deliveryAddress,
      "orderAmount": orderAmount,
      "orderCount": orderCount,
      "productName": productName,
      "productQuantity": productQuantity,
      "orderStatus": orderStatus,
      "AssignedTo": AssignedTo,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    });
  }
}
