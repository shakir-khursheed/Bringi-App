import 'package:bringi_app/RETAILER_FLOW/dashboard/services/retailer_dashboard_webApi.dart';
import 'package:bringi_app/Response_model/checked_out_product_response.dart';
import 'package:bringi_app/Response_model/product_list_response.dart';
import 'package:bringi_app/Response_model/saved_address_response.dart';
import 'package:bringi_app/base/base_repo.dart';

class RetailerDashboardRepo extends BaseRepo<RetailerDashboardWebApi> {
  Future<ProductListResponse> getProducts() async {
    return await webApi.getProducts();
  }

  Future<void> saveAddress({List<Map<String, dynamic>>? address}) async {
    return await webApi.saveAddress(
      address: address,
      uid: await getPhoneNo(),
    );
  }

  Future<SavedAddressResponse> getSavedAddress() async {
    return await webApi.getSavedAddress(
      uid: await getPhoneNo(),
    );
  }

}
