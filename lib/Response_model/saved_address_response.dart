// To parse this JSON data, do
//
//     final savedAddressResponse = savedAddressResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

SavedAddressResponse savedAddressResponseFromJson(String str) =>
    SavedAddressResponse.fromJson(json.decode(str));

String savedAddressResponseToJson(SavedAddressResponse data) =>
    json.encode(data.toJson());

class SavedAddressResponse {
  List<Address> addresses;

  SavedAddressResponse({
    required this.addresses,
  });

  factory SavedAddressResponse.fromJson(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      SavedAddressResponse(
        addresses: List<Address>.from(
            json["Addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };
}

class Address {
  String address;
  String city;
  String pincode;

  Address({
    required this.address,
    required this.city,
    required this.pincode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        city: json["city"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "pincode": pincode,
      };
}
