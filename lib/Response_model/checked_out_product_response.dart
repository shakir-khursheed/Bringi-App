// To parse this JSON data, do
//
//     final checkoutProductResponse = checkoutProductResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CheckoutProductResponse checkoutProductResponseFromJson(String str) =>
    CheckoutProductResponse.fromJson(json.decode(str));

String checkoutProductResponseToJson(CheckoutProductResponse data) =>
    json.encode(data.toJson());

class CheckoutProductResponse {
  String address;
  String amount;
  String orderId;
  String productName;

  CheckoutProductResponse({
    required this.address,
    required this.amount,
    required this.orderId,
    required this.productName,
  });

  factory CheckoutProductResponse.fromJson(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      CheckoutProductResponse(
        address: json["address"],
        amount: json["amount"],
        orderId: json["orderId"],
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "amount": amount,
        "orderId": orderId,
        "productName": productName,
      };
}
