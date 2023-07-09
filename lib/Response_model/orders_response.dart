// To parse this JSON data, do
//
//     final ordersResponse = ordersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

OrdersResponse ordersResponseFromJson(String str) =>
    OrdersResponse.fromJson(json.decode(str));

String ordersResponseToJson(OrdersResponse data) => json.encode(data.toJson());

class OrdersResponse {
  List<Order> orders;

  OrdersResponse({
    required this.orders,
  });

  factory OrdersResponse.fromJson(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      OrdersResponse(
        orders: List<Order>.from(json["Orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  String assignedTo;
  String orderId;
  DateTime createdAt;
  String deliveryAddress;
  String orderAmount;
  String orderCount;
  String orderStatus;
  String productName;
  String productQuantity;
  String updatedAt;

  Order({
    required this.assignedTo,
    required this.orderId,
    required this.createdAt,
    required this.deliveryAddress,
    required this.orderAmount,
    required this.orderCount,
    required this.orderStatus,
    required this.productName,
    required this.productQuantity,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        assignedTo: json["AssignedTo"],
        orderId: json["OrderId"],
        createdAt: DateTime.parse(json["createdAt"]),
        deliveryAddress: json["deliveryAddress"],
        orderAmount: json["orderAmount"],
        orderCount: json["orderCount"],
        orderStatus: json["orderStatus"],
        productName: json["productName"],
        productQuantity: json["productQuantity"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "AssignedTo": assignedTo,
        "OrderId": orderId,
        "createdAt": createdAt.toIso8601String(),
        "deliveryAddress": deliveryAddress,
        "orderAmount": orderAmount,
        "orderCount": orderCount,
        "orderStatus": orderStatus,
        "productName": productName,
        "productQuantity": productQuantity,
        "updatedAt": updatedAt,
      };
}
