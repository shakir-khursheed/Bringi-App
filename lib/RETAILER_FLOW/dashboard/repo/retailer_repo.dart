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

  Future<void> addTocheckOut({
    String? orderId,
    String? productName,
    String? amount,
    String? address,
  }) async {
    return await webApi.addTocheckOut(
      orderId: orderId,
      productName: productName,
      amount: amount,
      address: address,
      uid: await getPhoneNo(),
    );
  }

  Future<CheckoutProductResponse> getcheckedOutProduct() async {
    return await webApi.getcheckedOutProduct(
      uid: await getPhoneNo(),
    );
  }

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
  }) async {
    return await webApi.createOrder(
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
      uid: await getPhoneNo(),
    );
  }
}
