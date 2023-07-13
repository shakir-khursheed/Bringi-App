
import 'package:bringi_app/Response_model/saved_address_response.dart';
import 'package:bringi_app/base/base_webApi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Response_model/product_list_response.dart';

abstract class RetailerDashboardWebApi extends BaseWebApi {
  Future<ProductListResponse> getProducts();
  Future<void> saveAddress({
    List<Map<String, dynamic>>? address,
    String? uid,
  });
  Future<SavedAddressResponse> getSavedAddress({
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

}
