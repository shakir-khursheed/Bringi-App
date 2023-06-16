class UserModel {
  final String? id;
  final String mobileNo;
  final String shopName;
  final String address;
  final List<DocumentProof> documentProofs;
  final String role;
  final String createdAt;
  const UserModel({
    this.id,
    required this.mobileNo,
    required this.shopName,
    required this.address,
    required this.documentProofs,
    required this.role,
    required this.createdAt,
  });
  factory UserModel.fromJson(Map<String, dynamic>? json) => UserModel(
        id: json?["id"],
        mobileNo: json?["mobileNo"],
        shopName: json?["shopName"],
        address: json?["address"],
        documentProofs: List<DocumentProof>.from(
            json?["documentUrl"].map((x) => DocumentProof.fromJson(x))),
        role: json?["role"],
        createdAt: json?["createdAt"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "mobileNo": mobileNo,
        "shopName": shopName,
        "address": address,
        "documentProofs":
            List<dynamic>.from(documentProofs.map((e) => e.toJson())),
        "role": role,
        "createdAt": createdAt,
      };
}

class DocumentProof {
  String? documentUrl;
  DocumentProof({this.documentUrl});
  factory DocumentProof.fromJson(Map<String, dynamic>? json) => DocumentProof(
        documentUrl: json?["documentUrl"],
      );
  Map<String?, dynamic> toJson() => {
        "documentUrl": documentUrl,
      };
}
