class UserModel {
  final String? id;
  final String mobileNo;
  final String shopName;
  final String address;
  final String docProof1Url;
  final String? docProof2Url;
  final String? docProof3Url;
  final String role;
  final String createdAt;
  const UserModel({
    this.id,
    required this.mobileNo,
    required this.shopName,
    required this.address,
    required this.docProof1Url,
    this.docProof2Url,
    this.docProof3Url,
    required this.role,
    required this.createdAt,
  });
  factory UserModel.fromJson(Map<String, dynamic>? json) => UserModel(
        id: json?["id"],
        mobileNo: json?["mobileNo"],
        shopName: json?["shopName"],
        address: json?["address"],
        docProof1Url: json?["docProof1Url"],
        docProof2Url: json?["docProof2Url"],
        docProof3Url: json?["docProof3Url"],
        role: json?["role"],
        createdAt: json?["createdAt"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "mobileNo": mobileNo,
        "shopName": shopName,
        "address": address,
        "docProof1Url": docProof1Url,
        "docProof2Url": docProof2Url,
        "docProof3Url": docProof3Url,
        "role": role,
        "createdAt": createdAt,
      };
}
