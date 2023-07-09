// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ProductListResponse productListResponseFromJson(String str) =>
    ProductListResponse.fromJson(json.decode(str));

String productListResponseToJson(ProductListResponse data) =>
    json.encode(data.toJson());

class ProductListResponse {
  List<ListOfProduct> listOfProducts;

  ProductListResponse({
    required this.listOfProducts,
  });

  factory ProductListResponse.fromJson(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      ProductListResponse(
        listOfProducts: List<ListOfProduct>.from(
            json["List of products"].map((x) => ListOfProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "List of products":
            List<dynamic>.from(listOfProducts.map((x) => x.toJson())),
      };
}

class ListOfProduct {
  String city;
  String description;
  String gst;
  String hsnCode;
  List<String> imageUrls;
  String inStock;
  String margin;
  String mrp;
  String packOf12;
  String packOf120;
  String packOf24;
  String packOf60;
  String price;
  String productName;
  String userid;

  ListOfProduct({
    required this.city,
    required this.description,
    required this.gst,
    required this.hsnCode,
    required this.imageUrls,
    required this.inStock,
    required this.margin,
    required this.mrp,
    required this.packOf12,
    required this.packOf120,
    required this.packOf24,
    required this.packOf60,
    required this.price,
    required this.productName,
    required this.userid,
  });

  factory ListOfProduct.fromJson(Map<String, dynamic> json) => ListOfProduct(
        city: json["city"],
        description: json["description"],
        gst: json["gst"],
        hsnCode: json["hsn_code"],
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        inStock: json["in_stock"],
        margin: (json["margin"] != null) ? json["margin"] : "",
        mrp: json["mrp"],
        packOf12: json["pack_of_12"],
        packOf120: json["pack_of_120"],
        packOf24: json["pack_of_24"],
        packOf60: json["pack_of_60"],
        price: json["price"],
        productName: json["product_name"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "description": description,
        "gst": gst,
        "hsn_code": hsnCode,
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
        "in_stock": inStock,
        "margin": margin,
        "mrp": mrp,
        "pack_of_12": packOf12,
        "pack_of_120": packOf120,
        "pack_of_24": packOf24,
        "pack_of_60": packOf60,
        "price": price,
        "product_name": productName,
        "userid": userid,
      };
}
